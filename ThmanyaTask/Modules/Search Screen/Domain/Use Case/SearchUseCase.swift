//
//  SearchUseCase.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

class SearchUseCase: SearchUseCaseProtocol {
    private let searchRepository: SearchRepositoryProtocol
    
    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }
    
    func search(_ searchWord: String) async throws -> [Section] {
        return try await searchRepository.search(searchWord)
    }
}
