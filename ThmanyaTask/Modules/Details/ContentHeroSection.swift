//
//  ContentHeroSection.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//


import SwiftUI
import Kingfisher

struct ContentHeroSection: View {
    let item: ContentItem
    
    var body: some View {
        VStack(spacing: 16) {
            
            KFImage(URL(string: item.avatarURL))
                .onSuccess { _ in
                    DLog("Hero image loaded successfully")
                }
                .onFailure { error in
                    DLog("Hero image failed: \(error)")
                }
                .placeholder {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 250, height: 250)
                        .shimmering()
                }
                .resizable()
                .frame(width: 250, height: 250)
                .cornerRadius(16)
                .shadow(radius: 8)
            
            
            VStack(spacing: 8) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                
                Text(item.duration)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                
                Text(item.contentTypeName)
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color.orange.opacity(0.2))
                    .foregroundColor(.orange)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}
