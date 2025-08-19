//
//  SearchAPIRequest.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

enum SearchAPIRequest: APIRequestConfiguration {
    case search(searchWord: String)
    
    var method: HTTPMethods {
        switch self {
        case .search:
            return .GET
        }
        
    }
    
    var path: String {
        switch self {
        case .search:
            return APIs.search
        }
    }
    
    
    var parameters: BodyParameters? {
        nil
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    var queryParams: [String : Any]? {
        switch self {
        case .search(let searchWord):
            return ["search": searchWord]
        }
    }
    
    var files: [String]? {
        nil
    }
    
}
