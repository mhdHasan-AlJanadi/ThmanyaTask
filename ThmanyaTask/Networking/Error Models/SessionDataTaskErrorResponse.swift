//
//  SessionDataTaskErrorResponse.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

struct SessionDataTaskErrorResponse: Codable {
    let error: SessionDataTaskErrorModel?
}

struct SessionDataTaskErrorModel: Codable {
    let code: Int?
    let status: Int?
    let message: String?
}
