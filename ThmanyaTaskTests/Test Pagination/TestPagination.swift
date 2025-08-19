//
//  TestPagination.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 18/08/2025.
//


import Testing
import Combine
import XCTest

@testable import ThmanyaTask


final class MockHomeUseCase: HomeUseCaseProtocol {
    var calls: [Int] = []
    var responses: [Int: AppResponse] = [:]
    var error: SessionDataTaskError?
    
    func getAppData(page: Int) async throws -> ThmanyaTask.AppResponse {
        calls.append(page)
        if let error { throw SessionDataTaskError.requestFailed }
        guard let resp = responses[page] else {
            throw SessionDataTaskError.requestFailed
        }
        return resp
    }
}

func makeSections(start: Int, count: Int) -> [Section] {
    (start..<(start+count)).map { i in
        Section(name: "S\(i)", type: nil, contentType: nil, order: StringOrInt(stringValue: "1"), content: [])
    }
}

func makeResponse(page: Int, totalPages: Int, next: String?, count: Int, start: Int) -> AppResponse {
    AppResponse(
        sections: makeSections(start: start, count: count),
        pagination: Pagination(nextPage: next, totalPages: totalPages)
    )
}

final class HomeViewModelTests: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    
    func testFetchInitialLoadsFirstPage() async {
        DLog("Test FetchInitialLoadsFirstPage")
        let mock = MockHomeUseCase()
        mock.responses[1] = makeResponse(page: 1, totalPages: 3, next: "cursor-2", count: 10, start: 0)
        
        let vm = await HomeViewModel(useCase: mock)
        
        let exp = expectation(description: "Loaded first page")
        await vm.$sections
            .drop(while: { $0.isEmpty })
            .first()
            .sink { sections in
                XCTAssertEqual(sections.count, 10)
                exp.fulfill()
            }
            .store(in: &cancellables)
        
        await vm.fetchFirstTime()
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(mock.calls, [1])
    }
    
    func testLoadMoreAt10thItemAppends() async {
        let mock = MockHomeUseCase()
        mock.responses[1] = makeResponse(page: 1, totalPages: 3, next: "cursor-2", count: 10, start: 0)
        mock.responses[2] = makeResponse(page: 2, totalPages: 3, next: "cursor-3", count: 10, start: 10)

        let vm = await HomeViewModel(useCase: mock)

        let exp = expectation(description: "Loaded 20 items")
        var triggeredNext = false

        await vm.$sections
            .receive(on: DispatchQueue.main)
            .sink { sections in
                if sections.count == 10 && !triggeredNext {
                    triggeredNext = true
                    Task { @MainActor in
                        await vm.getNextPage(index: 9)
                    }
                }
                if sections.count == 20 {
                    exp.fulfill()
                }
            }
            .store(in: &cancellables)

        await vm.fetchFirstTime()
        wait(for: [exp], timeout: 1.0)

        await MainActor.run {
            XCTAssertEqual(vm.sections.count, 20)
        }
        XCTAssertEqual(mock.calls, [1, 2])
    }
    
    func testDoesNotLoadBeyondTotalPages() async {
        let mock = MockHomeUseCase()
        mock.responses[1] = makeResponse(page: 1, totalPages: 1, next: nil, count: 10, start: 0)

        let vm = await HomeViewModel(useCase: mock)
        await vm.fetchFirstTime()

        let _ = await vm.$sections.values.first { !$0.isEmpty }

        await MainActor.run {
            XCTAssertEqual(vm.sections.count, 10)
        }

        await vm.getNextPage(index: 9)

        await Task.yield()

        XCTAssertEqual(mock.calls, [1])
        
        await MainActor.run {
            XCTAssertEqual(vm.sections.count, 10)
        }
    }
    
    func testErrorPropagates() async {
        let mock = MockHomeUseCase()
        mock.error = .noData

        let vm = await HomeViewModel(useCase: mock)

        let exp = expectation(description: "Error surfaced")

        await vm.$error
            .compactMap { $0 }
            .first()
            .sink { err in
                XCTAssertFalse(err.isEmpty)
                exp.fulfill()
            }
            .store(in: &cancellables)

        await vm.fetchFirstTime()
        wait(for: [exp], timeout: 1.0)
    }
}
