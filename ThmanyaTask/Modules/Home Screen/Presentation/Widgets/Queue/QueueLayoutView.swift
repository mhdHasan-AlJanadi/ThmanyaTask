//
//  QueueLayoutView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//


import SwiftUI

struct QueueLayoutView: View {
    let content: [ContentItem]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(spacing: 8) {
                ForEach(Array(content.enumerated()), id: \.offset) { index, item in
                    QueueCard(item: item)
                        .frame(height: 160)
                }
            }
            .padding(.horizontal)
        }
    }
}
