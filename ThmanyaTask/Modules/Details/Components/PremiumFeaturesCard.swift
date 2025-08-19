//
//  PremiumFeaturesCard.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 19/08/2025.
//

import SwiftUI

struct PremiumFeaturesCard: View {
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "crown.fill")
                    .foregroundColor(.yellow)
                Text("Premium Content")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                if episode.paidIsExclusive == true {
                    Label("Exclusive Content", systemImage: "lock.fill")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
                
                if episode.paidIsEarlyAccess == true {
                    Label("Early Access", systemImage: "clock.fill")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(16)
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
        )
    }
}
