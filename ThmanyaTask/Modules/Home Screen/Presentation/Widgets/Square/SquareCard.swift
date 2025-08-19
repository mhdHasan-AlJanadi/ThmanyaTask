//
//  SquareCard.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import SwiftUI
import Kingfisher
import Shimmer

struct SquareCard: View {
    let item: ContentItem
    @State private var showingDetails = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            KFImage(URL(string: item.avatarURL))
                .onSuccess { right in
                    DLog("Loaded image size: \(right.image.size)")
                }
                .onFailure { error in
                    DLog("Error loading image: \(error)")
                }
                .placeholder {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 75, height: 75)
                        .shimmering()
                }
                .resizable()
                .cornerRadius(10)
                .frame(width: 100, height: 100)
                .shadow(radius: 4)
            
            Text(item.name)
                .font(ThemeApp.fonts.medium14)
                .foregroundStyle(ThemeApp.colors.boldTitle)
                .frame(width: 100, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            HStack{
                Text(item.duration)
                    .font(ThemeApp.fonts.medium10)
                    .foregroundStyle(.white)
                
                Image(systemName: "play.fill")
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 3)
            .background(
                Capsule()
                    .fill(ThemeApp.colors.boldTitle)
            )
        }
        .onTapGesture {
            showingDetails = true
        }
        .sheet(isPresented: $showingDetails) {
            ContentDetailsView(item: item)
        }
    }
}
