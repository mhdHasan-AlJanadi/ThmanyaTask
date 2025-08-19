//
//  ListContentCard.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//


import SwiftUI
import Kingfisher
import Shimmer

struct QueueCard: View {
    let item: ContentItem
    
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 6)
                .fill(ThemeApp.colors.queueBackground)
                .frame(width: 300, height: 160)
            
            HStack{
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
                            .frame(width: 120, height: 120)
                            .shimmering()
                    }
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 120, height: 120)
                    .shadow(radius: 4)
                    .padding(.leading, 8)                
                
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(ThemeApp.fonts.medium14)
                        .foregroundStyle(ThemeApp.colors.overImageTitle)
                    
                    Text(item.duration)
                        .font(ThemeApp.fonts.medium10)
                        .foregroundStyle(.white)
                    
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
