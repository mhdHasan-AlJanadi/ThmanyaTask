//
//  AppResponse.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//



struct AppResponse: Codable {
    let sections: [Section]
    let pagination: Pagination?
}

struct Pagination: Codable {
    let nextPage: String?
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}


struct Section: Codable {
    var name: String?
    var type: String?
    var contentType: String?
    var order: StringOrInt?
    var content: [ContentItem]
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case contentType = "content_type"
        case order
        case content
    }

}




enum ContentType: String, Codable {
    case podcast
    case episode
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
}


enum StringOrInt: Codable {
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let intValue = try? container.decode(Int.self) {
            self = .int(intValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else {
            throw DecodingError.typeMismatch(StringOrInt.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                    debugDescription: "Value is not a String or Int"))
        }
    }
    
    init(stringValue: String) {
        if let intValue = Int(stringValue) {
            self = .int(intValue)
        } else {
            self = .string(stringValue)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        }
    }
    
    var intValue: Int? {
        switch self {
        case .int(let value):
            return value
        case .string(let value):
            return Int(value)
        }
    }
    
    var stringValue: String {
        switch self {
        case .int(let value):
            return String(value)
        case .string(let value):
            return value
        }
    }
}


enum StringOrDouble: Codable {
    case string(String)
    case double(Double)
    
    init(stringValue: String) {
        if let doubleValue = Double(stringValue) {
            self = .double(doubleValue)
        } else {
            self = .string(stringValue)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let doubleValue = try? container.decode(Double.self) {
            self = .double(doubleValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else {
            throw DecodingError.typeMismatch(StringOrInt.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                    debugDescription: "Value is not a String or Int"))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        }
    }
    
    var intValue: Double? {
        switch self {
        case .double(let value):
            return value
        case .string(let value):
            return Double(value)
        }
    }
    
    var stringValue: String {
        switch self {
        case .double(let value):
            return String(value)
        case .string(let value):
            return value
        }
    }
}
