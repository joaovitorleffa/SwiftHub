//
//  RepositorySearchView.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct RepositorySearchView: View {
    @ObservedObject var viewModel: RepositorySearchViewModel = .init()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SearchBarView(text: $viewModel.searchText)) {
                    ForEach(viewModel.repositories) { item in
                        NavigationLink(destination: RepositoryDetailsView(repository: item)) {
                            RepositoryView(repository: item)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Search")
        }
        .navigationViewStyle(.stack)
    }
}

struct RepositorySearchView_Previews: PreviewProvider {
    static var previews: some View {
        let view = RepositorySearchView()
    
        view.configureNavigationBar()
        view.viewModel.repositories = [
            .mocked, .mocked, .mocked, .mocked, .mocked, .mocked, .mocked, .mocked, .mocked
        ]
        
        return view
    }
}
