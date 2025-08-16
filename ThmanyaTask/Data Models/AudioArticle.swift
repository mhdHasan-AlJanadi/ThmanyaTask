//
//  AudioArticle.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

struct AudioArticle: Codable {
    var articleId: String?
    var name: String?
    var authorName: String?
    var description: String?
    var avatarURL: String?
    var duration: Int?
    var releaseDate: String?
    var score: Int?
    
    enum CodingKeys: String, CodingKey {
        case articleId = "article_id"
        case name
        case authorName = "author_name"
        case description
        case avatarURL = "avatar_url"
        case duration
        case releaseDate = "release_date"
        case score
    }
}
