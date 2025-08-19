//
//  TwoLinesGridLayoutView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//

import SwiftUI

struct TwoLinesGridLayoutView: View {
    let content: [ContentItem]
    
    var body: some View {
        let columns = [
            GridItem(.fixed(70)),
            GridItem(.fixed(70))
        ]
        ScrollView(.horizontal){
            LazyHGrid(rows: columns, spacing: 16) {
                ForEach(Array(content.enumerated()), id: \.offset) { index, item in
                    TwoLinesGridCard(item: item)
                        .frame(width: 230)
                }
            }
            .padding(.horizontal)
        }
    }
}


