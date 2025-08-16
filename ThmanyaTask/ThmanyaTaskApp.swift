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
            HomeModuleFactory.makeHomeModule()
        }
    }
}
