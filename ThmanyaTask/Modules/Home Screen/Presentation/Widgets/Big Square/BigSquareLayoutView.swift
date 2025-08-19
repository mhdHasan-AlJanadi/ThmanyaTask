//
//  BigSquareLayoutView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//


import SwiftUI

struct BigSquareLayoutView: View {
    let content: [ContentItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 1) {
                ForEach(Array(content.enumerated()), id: \.offset) { index, item in
                    BigSquareCard(item: item)
                        .frame(width: 303, height: 200)
                }
            }
        }
    }
}
