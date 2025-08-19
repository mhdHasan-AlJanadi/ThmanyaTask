//
//  ContentDetailsView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct ContentDetailsView: View {
    let item: ContentItem
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    
                    ContentHeroSection(item: item)
                    
                    
                    switch item {
                    case .podcast(let podcast):
                        PodcastDetailsSection(podcast: podcast)
                    case .episode(let episode):
                        EpisodeDetailsSection(episode: episode)
                    case .audioBook(let audioBook):
                        AudioBookDetailsSection(audioBook: audioBook)
                    case .audioArticle(let audioArticle):
                        AudioArticleDetailsSection(audioArticle: audioArticle)
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: shareContent) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .overlay(alignment: .bottom) {
                PlayControlsBar(item: item)
            }
        }
    }
    
    private func shareContent() {
        print("Sharing: \(item.name)")
    }
}
