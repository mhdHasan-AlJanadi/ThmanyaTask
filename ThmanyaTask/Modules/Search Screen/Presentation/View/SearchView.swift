//
//  SearchView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 17/08/2025.
//


import SwiftUI

struct SearchScreen: View {
    @StateObject var viewModel : SearchViewModel
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            Spacer()
            if viewModel.sections.isEmpty {
                VStack{
                    Image(systemName: "exclamationmark.magnifyingglass")
                        .resizable()
                        .foregroundStyle(.gray)
                        .frame(width: 170, height: 170)
                    
                    Text("Search about anything")
                }
            } else {
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.sections, id: \.name){ section in
                            GridView(section: section)
                                .padding()
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
}

