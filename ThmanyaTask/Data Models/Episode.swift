//
//  Episode.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//
struct Episode : Codable {
    var episodeId : String?
    var podcastPopularityScore : Int?
    var podcastPriority : Int?
    var name : String?
    var episodeType : String?
    var podcastName : String?
    var authorName : String?
    var description : String?
    var duration : StringOrInt?
    var avatarURL : String?
    var separatedAudioURL : String?
    var audioURL : String?
    var podcastId : String?
    var paidIsEarlyAccess : Bool?
    var paidIsNowEarlyAccess : Bool?
    var paidIsExclusive : Bool?
    var paidIsExclusivePartially : Bool?
    var paidExclusiveStartTime : Int?
    var score : String?
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case podcastPopularityScore
        case podcastPriority
        case name
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case description
        case duration
        case avatarURL = "avatar_url"
        case separatedAudioURL = "separated_audio_url"
        case audioURL = "audio_url"
        case podcastId = "podcast_id"
        case paidIsEarlyAccess = "paid_is_early_access"
        case paidIsNowEarlyAccess = "paid_is_now_early_access"
        case paidIsExclusive = "paid_is_exclusive"
        case paidIsExclusivePartially = "paid_is_exclusive_partially"
        case paidExclusiveStartTime = "paid_exclusive_start_Time"
        case score
    }
}
