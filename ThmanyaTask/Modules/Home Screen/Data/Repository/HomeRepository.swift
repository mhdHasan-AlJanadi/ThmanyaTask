//
//  HomeRepository.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Combine

class HomeRepository {
    private let client: HomeAPIClientProtocol
    
    init(client: HomeAPIClientProtocol) {
        self.client = client
    }
}

extension HomeRepository: HomeRepositoryProtocol {
    func getAppData() -> AnyPublisher<[Section], SessionDataTaskError>{
        return client.getAppData()
            .mapError { $0 }
            .map { $0.sections }
            .eraseToAnyPublisher()
    }
}
