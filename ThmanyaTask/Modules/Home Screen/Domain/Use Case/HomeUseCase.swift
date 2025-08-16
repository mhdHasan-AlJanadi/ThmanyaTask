//
//  HomeUseCase.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Combine

class HomeUseCase : HomeUseCaseProtocol{
    
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    func getAppData() -> AnyPublisher<[Section], SessionDataTaskError>{
        return homeRepository.getAppData()
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
