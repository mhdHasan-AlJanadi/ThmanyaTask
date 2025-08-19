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
    
    func getAppData(page: Int) -> AnyPublisher<AppResponse, SessionDataTaskError> {
        calls.append(page)
        
        if let error { return Fail(error: error).eraseToAnyPublisher() }
        
        guard let resp = responses[page] else {
            return Fail(error: .noData).eraseToAnyPublisher()
        }
        
        
        return Just(resp)
            .setFailureType(to: SessionDataTaskError.self)
            .eraseToAnyPublisher()
    }
}

func makeSections(start: Int, count: Int) -> [Section] {
    (start..<(start+count)).map { i in
        Section(name: "S\(i)", type: nil, contentType: nil, order: i, content: [])
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
    
    func testFetchInitialLoadsFirstPage() {
        DLog("Test FetchInitialLoadsFirstPage")
        let mock = MockHomeUseCase()
        mock.responses[1] = makeResponse(page: 1, totalPages: 3, next: "cursor-2", count: 10, start: 0)
        
        let vm = HomeViewModel(useCase: mock)
        
        let exp = expectation(description: "Loaded first page")
        vm.$sections
            .drop(while: { $0.isEmpty })
            .first()
            .sink { sections in
                XCTAssertEqual(sections.count, 10)
                exp.fulfill()
            }
            .store(in: &cancellables)
        
        vm.fetchFirstTime()
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(mock.calls, [1])
    }
    
    func testLoadMoreAt10thItemAppends() {
        let mock = MockHomeUseCase()
        mock.responses[1] = makeResponse(page: 1, totalPages: 3, next: "cursor-2", count: 10, start: 0)
        mock.responses[2] = makeResponse(page: 2, totalPages: 3, next: "cursor-3", count: 10, start: 10)

        let vm = HomeViewModel(useCase: mock)

        let exp = expectation(description: "Loaded 20 items")
        var triggeredNext = false

        vm.$sections
            .receive(on: DispatchQueue.main)
            .sink { sections in
                if sections.count == 10 && !triggeredNext {
                    triggeredNext = true
                    vm.getNextPage(index: 9)
                }
                if sections.count == 20 {
                    exp.fulfill()
                }
            }
            .store(in: &cancellables)

        vm.fetchFirstTime()
        wait(for: [exp], timeout: 1.0)

        XCTAssertEqual(vm.sections.count, 20)
        XCTAssertEqual(mock.calls, [1, 2])
    }
    
    func testDoesNotLoadBeyondTotalPages() async {
        let mock = MockHomeUseCase()
        mock.responses[1] = makeResponse(page: 1, totalPages: 1, next: nil, count: 10, start: 0)

        let vm = HomeViewModel(useCase: mock)
        vm.fetchFirstTime()

        let _ = await vm.$sections.values.first { !$0.isEmpty }

        XCTAssertEqual(vm.sections.count, 10)

        vm.getNextPage(index: 9)

        await Task.yield()

        XCTAssertEqual(mock.calls, [1])
        XCTAssertEqual(vm.sections.count, 10)
    }
    
    func testErrorPropagates() {
        let mock = MockHomeUseCase()
        mock.error = .noData

        let vm = HomeViewModel(useCase: mock)

        let exp = expectation(description: "Error surfaced")

        vm.$error
            .compactMap { $0 }
            .first()
            .sink { err in
                XCTAssertFalse(err.isEmpty)
                exp.fulfill()
            }
            .store(in: &cancellables)

        vm.fetchFirstTime()
        wait(for: [exp], timeout: 1.0)
    }
}
