//
//  SearchUseCaseProtocol.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

protocol SearchUseCaseProtocol {
    func search(_ searchWord: String) async throws -> [Section]
}
