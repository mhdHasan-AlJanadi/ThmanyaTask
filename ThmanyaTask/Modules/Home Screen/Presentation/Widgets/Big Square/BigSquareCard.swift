//
//  BigSquareCard.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import SwiftUI
import Kingfisher

struct BigSquareCard: View {
    let item: ContentItem
    @State private var showingDetails = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
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
                            .frame(width: 293, height: 200)
                            .shimmering()
                    }
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 293, height: 200)
                    .shadow(radius: 4)
                
                VStack(alignment: .leading, spacing: 0){
                    
                    Text(item.name)
                        .font(ThemeApp.fonts.bold16)
                        .foregroundStyle(ThemeApp.colors.overImageTitle)
                        .frame(width: 200, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    HStack{
                        Text(item.duration)
                            .font(ThemeApp.fonts.medium10)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.bottom, 8)
                .padding(.leading, 8)
            }
        }
        .onTapGesture {
            showingDetails = true
        }
        .sheet(isPresented: $showingDetails) {
            ContentDetailsView(item: item)
        }
    }
}
