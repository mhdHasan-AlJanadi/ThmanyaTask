//
//  HomeRepository.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//
//



class HomeRepository: HomeRepositoryProtocol {
    private let client: HomeAPIClientProtocol
    
    init(client: HomeAPIClientProtocol) {
        self.client = client
    }
    
    func getAppData(page: Int) async throws -> AppResponse {
        let response = try await client.getAppData(page: page)
        return response
    }
}

