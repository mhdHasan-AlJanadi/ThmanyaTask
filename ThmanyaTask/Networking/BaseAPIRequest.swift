//
//  BaseAPIRequest.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import Foundation

enum BaseAPIRequest: APIRequestConfiguration {
    
    
    var method: HTTPMethods {
        switch self {
        default:
            return .GET
        }
    }
    
    
    var path: String {
        return ""
    }
    
    
    var parameters: BodyParameters? {
        return [:]
    }
    
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
    var queryParams: [String : Any]? {
        return nil
    }
}
