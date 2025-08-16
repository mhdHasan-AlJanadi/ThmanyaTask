//
//  HomeAPIClient.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Foundation
import Combine

protocol HomeAPIClientProtocol {
    func getAppData() -> AnyPublisher<AppResponse, SessionDataTaskError>
}

class HomeAPIClient {
    private let client: BaseAPIClientProtocol
    
    init(client: BaseAPIClientProtocol) {
        self.client = client
    }
}

extension HomeAPIClient: HomeAPIClientProtocol {    
    func getAppData() -> AnyPublisher<AppResponse, SessionDataTaskError>{
        let dataRequest = HomeAPIRequest.getAppData
        return client.perform(dataRequest.asURLRequest())
    }
}
