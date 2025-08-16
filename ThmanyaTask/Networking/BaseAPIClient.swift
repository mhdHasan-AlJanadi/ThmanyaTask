//
//  BaseAPIClient.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import Foundation
import Combine

protocol BaseAPIClientProtocol {
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, SessionDataTaskError>
}

struct BaseAPIClient: BaseAPIClientProtocol {
    private let session = URLSession.shared
    func perform<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, SessionDataTaskError> {
        if let url = request.url {
            DLog("[\(request.httpMethod?.uppercased() ?? "")] '\(url)'")
            DLog("(((((q)))))")
        } else {
            DLog("❌ ERROR WHILE RETRIEVING REQUEST URL ❌")
        }
        return session.dataTaskPublisher(for: request)
            .tryMap { result in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    DLog("(((((qqq)))))")
                    throw SessionDataTaskError.requestFailed
                }
                DLog("(((((qq)))))")
                printOutput(request: request, response: result)
                
                let statusCode = httpResponse.statusCode
                switch statusCode {
                case 200..<300:
                    if let url = request.url {
                        
                        DLog("[\(request.httpMethod?.uppercased() ?? "")] '\(url)'")
                        DLog("(((((u)))))")
                    } else {
                        DLog("❌ ERROR WHILE RETRIEVING REQUEST URL ❌")
                        throw SessionDataTaskError.notValidURL
                    }
                    return result.data
                    /// 1020 means dataNotAllowed -> Internet is closed
                    /// 1009 Internet is opened but no connection happens
                case 1009, 1020:
                    throw SessionDataTaskError.noInternetConnection
                case 404:
                    throw SessionDataTaskError.notFound
                case 400, 401:
                    throw SessionDataTaskError.notAuthorized
                case 500 ... 599:
                    throw SessionDataTaskError.server
                default:
                    if let error = try? JSONDecoder().decode(SessionDataTaskErrorResponse.self, from: result.data) {
                        throw SessionDataTaskError.internalError(error)
                    } else {
                        throw SessionDataTaskError.emptyErrorWithStatusCode(httpResponse.statusCode.description)
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> SessionDataTaskError in
                if let error = error as? SessionDataTaskError {
                    return error
                }
                return SessionDataTaskError.failWithError(error)
            }
            .eraseToAnyPublisher()
    }
    
    func printOutput(request: URLRequest, response: URLSession.DataTaskPublisher.Output){
        DLog("Api tracking")
        DLog("URL: \(request.url?.absoluteString ?? "NULL URL")")
        DLog("Method: \(request.httpMethod ?? "NULL METHOD")")
        if let httpHeader = request.allHTTPHeaderFields {
            DLog("Headers: \(httpHeader)")
        }
        
        if let httpBody = request.httpBody {
            if let jsonObject = try? JSONSerialization.jsonObject(with: httpBody, options: []),
               let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
               let prettyPrintedString = String(data: prettyData, encoding: .utf8) {
                DLog("Body (JSON): \(prettyPrintedString)")
            } else if let bodyString = String(data: httpBody, encoding: .utf8) {
                DLog("Body (String): \(bodyString)")
            } else {
                DLog("Request Body: Unable to decode body data.")
            }
        }
        
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers),
           let prettyPrintedData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
            DLog("Response: \(prettyPrintedString)")
        } else {
            
            DLog("Response (Not JSON): \(String(data: response.data, encoding: .utf8) ?? "Unable to decode data")")
            
        }
    }
}
