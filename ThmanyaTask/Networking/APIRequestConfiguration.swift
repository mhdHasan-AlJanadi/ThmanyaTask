//
//  APIRequestConfiguration.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import Foundation

protocol APIRequestConfiguration {
    var method: HTTPMethods { get }
    var path: String { get }
    var queryParams: [String: Any]? { get }
    var parameters: BodyParameters? { get }
    var headers: HTTPHeaders? { get }
}

extension APIRequestConfiguration {
    private var baseHeaders: HTTPHeaders {
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        return headers
    }
    
    
    
    
    func asURLRequestNew() throws -> URLRequest {
        var urlRequest: URLRequest
        
        if path.lowercased().hasPrefix("http://") || path.lowercased().hasPrefix("https://") {
            if queryParams == nil {
                if let encodedPath = path.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
                   let url = URL(string: encodedPath) {
                    urlRequest = URLRequest(url: url)
                } else if let url = URL(string: path) {
                    urlRequest = URLRequest(url: url)
                } else {
                    throw URLError(.badURL)
                }
            } else {
                guard var urlComponents = URLComponents(string: path) else {
                    return URLRequest(url: URL(fileURLWithPath: ""))
                }
                
                let queryItem = addQueryItems(queryParams: queryParams ?? [:])
                urlComponents.queryItems = queryItem
                
                guard let url = urlComponents.url else {
                    return URLRequest(url: URL(fileURLWithPath: ""))
                }
                urlRequest = URLRequest(url: url)
            }
            
        } else {
        
            var components = self.components
            components.path = "/" + path
            guard let url = components.url else {
                fatalError("Invalid URL components")
            }
            urlRequest = URLRequest(url: url)
        }
        
        
        urlRequest.httpMethod = method.rawValue
        
        
        let requestHeaders = baseHeaders + headers
        requestHeaders.forEach { (headerKey, headerValue) in
            urlRequest.addValue(headerValue, forHTTPHeaderField: headerKey)
        }
        
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                
                print("Error serializing parameters: \(error)")
            }
        }
        
        return urlRequest
    }
    
    var components: URLComponents {
        let components = URLComponents()
        return components
    }
    
    private func addQueryItems(queryParams: [String: Any]) -> [URLQueryItem] {
        return queryParams.map({
            URLQueryItem(name: $0.key, value: "\($0.value)")}
        )
    }
    
    func convertToDictionary<T: Encodable>(_ model: T) -> [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(model)
            let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
            return dictionary
        } catch {
            DLog("Error converting model to dictionary: \(error)")
            return nil
        }
    }
}

enum HTTPMethods: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}

typealias HTTPHeaders = [String:String]
typealias BodyParameters = [String: Any]
