//
//  Podcast.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

struct Podcast: Codable{
    var podcastId: String?
    var name: String?
    var description: String?
    var avatarURL: String?
    var episodeCount: StringOrInt?
    var duration: StringOrInt?
    var language: String?
    var priority: StringOrInt?
    var popularityScore: StringOrInt?
    var score: StringOrDouble?
    
    enum CodingKeys: String, CodingKey {
        case podcastId = "podcast_id"
        case name
        case description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration
        case language
        case priority
        case popularityScore
        case score
    }
    
   
}
