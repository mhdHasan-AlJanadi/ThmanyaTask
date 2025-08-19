//
//  HomeAPIClient.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Foundation

protocol HomeAPIClientProtocol {
    func getAppData(page: Int) async throws -> AppResponse
}

class HomeAPIClient: HomeAPIClientProtocol {
    private let client: BaseAPIClientProtocolNew
    
    init(client: BaseAPIClientProtocolNew) {
        self.client = client
    }
    
    func getAppData(page: Int) async throws -> AppResponse {
        let dataRequest = HomeAPIRequest.getAppData(page: page)
        let urlRequest = try dataRequest.asURLRequestNew()
        return try await client.perform(urlRequest)
    }
}
