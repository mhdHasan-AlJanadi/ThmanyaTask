//
//  HomeUseCaseProtocol.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Combine

protocol HomeUseCaseProtocol {
    func getAppData() -> AnyPublisher<[Section], SessionDataTaskError>
}
