//
//  AppResponse.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//



struct AppResponse: Codable {
    let sections: [Section]
    let pagination: Pagination
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
    var contentType: ContentType?
    var order: Int?
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
