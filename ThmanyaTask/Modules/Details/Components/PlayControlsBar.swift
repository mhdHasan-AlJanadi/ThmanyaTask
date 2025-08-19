//
//  PlayControlsBar.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct PlayControlsBar: View {
    let item: ContentItem
    @State private var isPlaying = false
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                
            }) {
                Image(systemName: "heart")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "gobackward.15")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Button(action: {
                isPlaying.toggle()
                
            }) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.orange)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "goforward.30")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "ellipsis")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(
            Rectangle()
                .fill(Color(UIColor.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: -2)
        )
    }
}
