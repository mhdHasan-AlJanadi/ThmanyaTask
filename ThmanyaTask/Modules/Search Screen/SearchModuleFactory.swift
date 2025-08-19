//
//  SearchModuleFactory.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import Foundation

class SearchModuleFactory {
    @MainActor static func makeHomeModule() -> SearchScreen {
        let baseAPIClient = BaseAPIClientNew()
        let searchClient = SearchAPIClient(client: baseAPIClient)
        let searchRepository = SearchRepository(client: searchClient)
        let useCase = SearchUseCase(
            searchRepository: searchRepository
        )
        let viewModel = SearchViewModel(
            useCase: useCase
        )
        let view = SearchScreen(viewModel: viewModel)
        return view
    }
}
