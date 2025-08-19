//
//  SquareLayoutView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import SwiftUI

struct SquareLayoutView: View {
    let content: [ContentItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(Array(content.enumerated()), id: \.offset) { index, item in
                    SquareCard(item: item)
                        .frame(width: 110, height: 150)
                }
            }
        }
    }
}
