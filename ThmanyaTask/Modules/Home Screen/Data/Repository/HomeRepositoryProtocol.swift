//
//  HomeRepositoryProtocol.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import Combine

protocol HomeRepositoryProtocol {
    func getAppData() -> AnyPublisher<[Section], SessionDataTaskError>
}
