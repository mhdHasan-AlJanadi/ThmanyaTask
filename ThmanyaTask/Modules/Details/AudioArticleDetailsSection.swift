//
//  AudioArticleDetailsSection.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//


import SwiftUI

struct AudioArticleDetailsSection: View {
    let audioArticle: AudioArticle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            DetailsSectionHeader(title: "Article Information")
            
            
            if let authorName = audioArticle.authorName {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Author")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(authorName)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            
            if let description = audioArticle.description {
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                if let releaseDate = audioArticle.releaseDate {
                    StatCard(title: "Published", value: formatDate(releaseDate))
                }
                StatCard(title: "Rating", value: "\(audioArticle.score ?? 0)")
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
    }
}
