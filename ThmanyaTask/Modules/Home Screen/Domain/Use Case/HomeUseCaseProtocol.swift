//
//  HomeUseCaseProtocol.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

protocol HomeUseCaseProtocol {
    func getAppData(page: Int) async throws -> AppResponse
}
