//
//  HomeRepositoryProtocol.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//



protocol HomeRepositoryProtocol {
    func getAppData(page: Int) async throws -> AppResponse
}
