//
//  AudioBook.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

struct AudioBook: Codable {
    var audiobookId: String?
    var name: String?
    var authorName: String?
    var description: String?
    var avatarURL: String?
    var duration: Int?
    var language: String?
    var releaseDate: String?
    var score: Int?
    
    enum CodingKeys: String, CodingKey {
        case audiobookId = "audiobook_id"
        case name
        case authorName = "author_name"
        case description
        case avatarURL = "avatar_url"
        case duration
        case language
        case releaseDate = "release_date"
        case score
    }
}
