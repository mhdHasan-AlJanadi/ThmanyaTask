//
//  ContentItem.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

enum ContentItem: Codable {
    case podcast(Podcast)
    case episode(Episode)
    case audioBook(AudioBook)
    case audioArticle(AudioArticle)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        // Try to decode as different types based on available keys
        if let podcast = try? container.decode(Podcast.self) {
            self = .podcast(podcast)
        } else if let episode = try? container.decode(Episode.self) {
            self = .episode(episode)
        } else if let audioBook = try? container.decode(AudioBook.self) {
            self = .audioBook(audioBook)
        } else if let audioArticle = try? container.decode(AudioArticle.self) {
            self = .audioArticle(audioArticle)
        } else {
            throw DecodingError.typeMismatch(
                ContentItem.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unable to decode ContentItem"
                )
            )
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .podcast(let podcast):
            try container.encode(podcast)
        case .episode(let episode):
            try container.encode(episode)
        case .audioBook(let audioBook):
            try container.encode(audioBook)
        case .audioArticle(let audioArticle):
            try container.encode(audioArticle)
        }
    }
}

extension ContentItem {
    // Helper computed properties to access common properties
    var name: String {
        switch self {
        case .podcast(let podcast):
            return podcast.name ?? "__"
        case .episode(let episode):
            return episode.name ?? "__"
        case .audioBook(let audioBook):
            return audioBook.name ?? "__"
        case .audioArticle(let audioArticle):
            return audioArticle.name ?? "__"
        }
    }
    
    var duration: Int {
        switch self {
        case .podcast(let podcast):
            return podcast.duration ?? 0
        case .episode(let episode):
            return episode.duration ?? 0
        case .audioBook(let audioBook):
            return audioBook.duration ?? 0
        case .audioArticle(let audioArticle):
            return audioArticle.duration ?? 0
        }
    }
}
