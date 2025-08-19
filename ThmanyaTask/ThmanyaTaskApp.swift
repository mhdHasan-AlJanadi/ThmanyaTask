//
//  ThmanyaTaskApp.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

import SwiftUI

@main
struct ThmanyaTaskApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabBar()
        }
    }
}


struct MainTabBar: View {
    var body: some View {
        TabView {
            HomeModuleFactory.makeHomeModule()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchModuleFactory.makeHomeModule()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

