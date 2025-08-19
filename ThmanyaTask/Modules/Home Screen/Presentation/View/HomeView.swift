//
//  HomeView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.sections, id: \.name){ section in
                    GridView(section: section)
                        .padding()
                }
                
                LoadMoreTrigger(isLoading: viewModel.isLoading) {
                    Task{
                        await viewModel.getNextPage(index: viewModel.sections.count - 1)
                    }
                    
                }

                
                if viewModel.isLoading {
                    ProgressView().padding(.vertical, 12)
                }
            }
        }
        .onAppear{
            if !viewModel.isDataLoaded{
                Task{
                    await viewModel.fetchFirstTime()
                }
                
            }
        }
    }
}

private struct LoadMoreTrigger: View {
    let isLoading: Bool
    let action: () -> Void

    var body: some View {
        // Keep it invisible & tiny; it only exists to detect reaching bottom
        Color.clear
            .frame(height: 1)
            .onAppear {
                if !isLoading { action() }
            }
            .accessibilityHidden(true)
    }
}

// MARK: - Helper Functions
func formatDate(_ dateString: String) -> String {
    let formatter = ISO8601DateFormatter()
    if let date = formatter.date(from: dateString) {
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        return displayFormatter.string(from: date)
    }
    return dateString
}
