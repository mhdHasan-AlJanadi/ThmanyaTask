//
//  SearchRepository.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

class SearchRepository: SearchRepositoryProtocol {
    private let client: SearchAPIClientProtocol
    
    init(client: SearchAPIClientProtocol) {
        self.client = client
    }
    
    func search(_ searchWord: String) async throws -> [Section] {
        let response = try await client.search(searchWord)
        return response.sections
    }
}
