//
//  TwoLinesGridCard.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import SwiftUI
import Kingfisher


struct TwoLinesGridCard: View {
    let item: ContentItem
    @State private var showingDetails = false
    
    var body: some View {
        HStack {
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
                        .frame(width: 60, height: 60)
                        .shimmering()
                }
                .resizable()
                .cornerRadius(10)
                .frame(width: 60, height: 60)
                .shadow(radius: 6)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(ThemeApp.fonts.medium14)
                    .foregroundStyle(ThemeApp.colors.boldTitle)
                    .lineLimit(2)
                
                Text(item.duration)
                    .font(ThemeApp.fonts.medium10)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 8)
        .onTapGesture {
            showingDetails = true
        }
        .sheet(isPresented: $showingDetails) {
            ContentDetailsView(item: item)
        }
    }
}
