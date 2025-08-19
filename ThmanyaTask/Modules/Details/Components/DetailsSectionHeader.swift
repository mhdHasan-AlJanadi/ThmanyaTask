//
//  DetailsSectionHeader.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct DetailsSectionHeader: View {
    let title: String
    
    var body: some View {
        Text(LocalizedStringResource(stringLiteral: title))
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
    }
}
