//
//  SessionDataTaskError.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import Foundation

enum SessionDataTaskError: Error {
    case failWithError(Error)
    case notValidURL
    case requestFailed
    case noData
    case decodingError
    case notFound
    case notAuthorized
    case server
    case noInternetConnection
    case internalError(SessionDataTaskErrorResponse)
    case emptyErrorWithStatusCode(String)
}
