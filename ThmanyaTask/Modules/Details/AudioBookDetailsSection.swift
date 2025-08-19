//
//  AudioBookDetailsSection.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct AudioBookDetailsSection: View {
    let audioBook: AudioBook
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            DetailsSectionHeader(title: "Book Information")
            
            
            if let authorName = audioBook.authorName {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Author")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(authorName)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            
            if let description = audioBook.description {
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                StatCard(title: "Language", value: audioBook.language?.uppercased() ?? "N/A")
                StatCard(title: "Rating", value: "\(audioBook.score ?? 0)")
                if let releaseDate = audioBook.releaseDate {
                    StatCard(title: "Released", value: formatDate(releaseDate))
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
    }
}
