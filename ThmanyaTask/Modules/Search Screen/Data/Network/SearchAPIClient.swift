//
//  SearchAPIClient.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import Foundation
import Combine

protocol SearchAPIClientProtocol {
    func search(_ searchWord: String) async throws -> AppResponse
}

class SearchAPIClient: SearchAPIClientProtocol {
    private let client: BaseAPIClientProtocolNew
    
    init(client: BaseAPIClientProtocolNew) {
        self.client = client
    }
    
    func search(_ searchWord: String) async throws -> AppResponse {
        let dataRequest = SearchAPIRequest.search(searchWord: searchWord)
        let urlRequest = try dataRequest.asURLRequestNew()
        return try await client.perform(urlRequest)
    }
}
