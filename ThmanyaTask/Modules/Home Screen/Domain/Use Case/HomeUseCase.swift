//
//  HomeUseCase.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//




class HomeUseCase: HomeUseCaseProtocol {
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func getAppData(page: Int) async throws -> AppResponse {
        return try await homeRepository.getAppData(page: page)
    }
}
