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
    
    var duration: String {
        switch self {
        case .podcast(let podcast):
            return getDurationFormat(duration: podcast.duration ?? .int(0))
        case .episode(let episode):
            return getDurationFormat(duration: episode.duration ?? .int(0))
        case .audioBook(let audioBook):
            return getDurationFormat(duration: audioBook.duration ?? .int(0))
        case .audioArticle(let audioArticle):
            return getDurationFormat(duration: audioArticle.duration ?? .int(0))
        }
    }
    
    var avatarURL: String {
        switch self {
        case .podcast(let podcast):
            return podcast.avatarURL ?? "__"
        case .episode(let episode):
            return episode.avatarURL ?? "__"
        case .audioBook(let audioBook):
            return audioBook.avatarURL ?? "__"
        case .audioArticle(let audioArticle):
            return audioArticle.avatarURL ?? "__"
        }
    }
    
    func getDurationFormat(duration: StringOrInt) -> String{
        var intDuration = 0
        switch duration {
        case.int(let int):
            intDuration = int
        case .string(let str):
            intDuration = Int(str) ?? 0
        }
        let hours = intDuration / 3600
        let minutes = (intDuration % 3600) / 60
        if hours <= 0{
            return "\(minutes) m"
        } else if minutes <= 0 {
            return "\(hours) h"
        } else {
            return "\(hours) h \(minutes) m"
        }
    }
}


extension ContentItem {
    var contentTypeName: String {
        switch self {
        case .podcast: return "Podcast"
        case .episode: return "Episode"
        case .audioBook: return "Audiobook"
        case .audioArticle: return "Article"
        }
    }
}
