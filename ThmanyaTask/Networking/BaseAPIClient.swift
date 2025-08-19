//
//  BaseAPIClient.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import Foundation
import Combine

protocol BaseAPIClientProtocolNew {
    func perform<T: Decodable>(_ request: URLRequest) async throws -> T
}


struct BaseAPIClientNew: BaseAPIClientProtocolNew {
    private let session = URLSession.shared
    func perform<T: Decodable>(_ request: URLRequest) async throws -> T {
        if let url = request.url {
            DLog("[\(request.httpMethod?.uppercased() ?? "")] '\(url)'")
        } else {
            DLog("❌ ERROR WHILE RETRIEVING REQUEST URL ❌")
        }
        let (data, response) = try await session.data(for: request)
        DLog("API tracking")
        DLog(T.self)
        DLog(data)
        DLog(response)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        let statusCode = httpResponse.statusCode
        DLog("Status Code: \(statusCode)")
        switch statusCode {
        case 200..<300:
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw error
            }
           
            
        case 1009, 1020:
            throw SessionDataTaskError.noInternetConnection
        case 404:
            throw SessionDataTaskError.notFound
        case 400, 401:
            throw SessionDataTaskError.notAuthorized
        case 500 ... 599:
            throw SessionDataTaskError.server
        default:
            throw URLError(.badServerResponse)
        }
    }
}
