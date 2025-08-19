//
//  PodcastDetailsSection.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//


import SwiftUI

struct PodcastDetailsSection: View {
    let podcast: Podcast
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            DetailsSectionHeader(title: "About This Podcast")
            
            if let description = podcast.description {
                Text(description.removingHTMLTags())
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                StatCard(title: "Episodes", value: "\(podcast.episodeCount ?? .int(0))")
                StatCard(title: "Language", value: podcast.language?.uppercased() ?? "N/A")
                StatCard(title: "Score", value: "\(podcast.score ?? .double(0))")
            }
            
            
            if let priority = podcast.priority {
                DetailRow(label: "Priority", value: "\(priority)")
            }
            
            if let popularityScore = podcast.popularityScore {
                DetailRow(label: "Popularity", value: "\(popularityScore)/10")
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
    }
}
