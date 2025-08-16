//
//  HomeView.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 16/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.sections, id: \.name){ section in
                    GridView(section: section)
                        .padding()
                }
            }
        }
        .onAppear{
            viewModel.fetchData()
        }
    }
    
    func sectionV(section: Section) -> some View {
        VStack{
            ForEach(Array(section.content.enumerated()), id: \.offset) { k in
                switch k.element{
                case .podcast(let podcast):
                    Text(podcast.name ?? "__")
                case .episode(let episode):
                    Text(episode.name ?? "__")
                case .audioBook(let audioBook):
                    Text(audioBook.name ?? "__")
                case .audioArticle(let audioArticle):
                    Text(audioArticle.name ?? "__")
                }
            }
        }
    }
   
}
