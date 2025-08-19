//
//  DetailRow.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(LocalizedStringResource(stringLiteral: label))
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}
