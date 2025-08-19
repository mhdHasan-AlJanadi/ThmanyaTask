//
//  HomeModuleFactory.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Foundation

class HomeModuleFactory {
    static func makeHomeModule() -> HomeView {
        let baseAPIClient = BaseAPIClientNew()
        let homeClient = HomeAPIClient(client: baseAPIClient)
        let homeRepository = HomeRepository(client: homeClient)
        let useCase = HomeUseCase(
            homeRepository: homeRepository
        )
        let viewModel = HomeViewModel(
            useCase: useCase
        )
        let view = HomeView(viewModel: viewModel)
        return view
    }
}
