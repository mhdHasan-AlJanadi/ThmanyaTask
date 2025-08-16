//
//  GridView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import SwiftUI

struct GridView: View {
    let section: Section
    
    var body: some View {
        VStack(alignment: .leading){
            Text(section.name ?? "__")
                .foregroundColor(.orange)
                .font(.custom("IBMPlexSansArabic-SemiBold", size: 16))
//                .foregroundStyle(.orange)
            ScrollView(.horizontal){
                LazyHStack(spacing: 10){
                    ForEach(Array(section.content.enumerated()), id: \.offset){ content in
                        switch content.element{
                        case .podcast(let podcast):
                            Text(podcast.name ?? "__")
                                .foregroundColor(.gray)
                                .font(.custom("IBMPlexSansArabic-Light", size: 16))
                        case .episode(let episode):
                            Text(episode.name ?? "__")
                                .foregroundColor(.red)
                                .font(.custom("IBMPlexSansArabic-ExtraLight", size: 16))
                        case .audioBook(let audioBook):
                            Text(audioBook.name ?? "__")
                                .foregroundColor(.blue)
                                .font(.custom("IBMPlexSansArabic-SemiBold", size: 16))
                        case .audioArticle(let audioArticle):
                            Text(audioArticle.name ?? "__")
                                .foregroundStyle(.green)
                                .font(.custom("IBMPlexSansArabic-Thin", size: 16))
                                
                        }
                    }
                }
            }
        }
    }
}
