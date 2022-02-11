//
//  SwiftHubApp.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import SwiftUI

@main
struct SwiftHubApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                RepositorySearchView()
                    .tabItem {
                        Text("Mobile repositories")
                        Image(systemName: "magnifyingglass")
                    }
                    .accentColor(.white)
                RepositoryListView()
                    .tabItem {
                        Text("Mobile repositories")
                        Image(systemName: "pc")
                    }
                    .accentColor(.white)
            }
        }
    }
}
