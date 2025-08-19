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
                .foregroundColor(ThemeApp.colors.boldTitle)
                .font(.custom("IBMPlexSansArabic-SemiBold", size: 16))
            
            switch section.type {
            case "square":
                SquareLayoutView(content: section.content)
            case "big_square","big square":
                BigSquareLayoutView(content: section.content)
            case "2_lines_grid":
                TwoLinesGridLayoutView(content: section.content)
            case "queue":
                QueueLayoutView(content: section.content)
            default:
                SquareLayoutView(content: section.content)
            }
        }
    }
}
