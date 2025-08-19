//
//  HomeAPIRequest.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

enum HomeAPIRequest: APIRequestConfiguration {
    case getAppData(page: Int)
    
    var method: HTTPMethods {
        switch self {
        case .getAppData:
            return .GET
        }
        
    }
    
    var path: String {
        switch self {
        case .getAppData:
            return APIs.appData
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
        case .getAppData(let page):
            return page != 1 ? ["page": page] : nil
        }
    }
    
    var files: [String]? {
        nil
    }
    
}
