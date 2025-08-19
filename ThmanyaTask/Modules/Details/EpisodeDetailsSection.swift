//
//  EpisodeDetailsSection.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct EpisodeDetailsSection: View {
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            DetailsSectionHeader(title: "Episode Information")
            
            
            if let podcastName = episode.podcastName {
                VStack(alignment: .leading, spacing: 4) {
                    Text("From Podcast")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(podcastName)
                        .font(.headline)
                        .foregroundColor(.orange)
                }
            }
            
            if let description = episode.description {
                Text(description.removingHTMLTags())
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                StatCard(title: "Type", value: episode.episodeType?.capitalized ?? "Episode")
                StatCard(title: "Podcast Score", value: "\(episode.podcastPopularityScore ?? 0)")
            }
            
            
            if episode.paidIsExclusive == true || episode.paidIsEarlyAccess == true {
                PremiumFeaturesCard(episode: episode)
            }
            
            
            if let authorName = episode.authorName, !authorName.isEmpty {
                DetailRow(label: "Author", value: authorName)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
    }
}
