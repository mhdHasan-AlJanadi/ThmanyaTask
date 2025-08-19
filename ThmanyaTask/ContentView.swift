//
//  ContentView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("مرحبا العالم")
                .font(.custom("IBMPlexSansArabic-Light", size: 34))
        }
        .padding()
    }
}
