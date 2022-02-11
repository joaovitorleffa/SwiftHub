//
//  RepositoryListView.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var viewModel: RepositoryListViewModel = .init()
    
    init() {
        configureNavigationBar()
    }
    
    var loaderView: some View {
        Group {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .mainPurple))
            Spacer()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Language.allCases, id: \.self) { item in
                            LanguagePillView(language: item.self)
                                .environmentObject(viewModel) // injeta o viewModel na propriedade @EnvironmentObject
                        }
                    }
                    .padding(.init(top: 16, leading: 8, bottom: 16, trailing: 8))
                    
                }
                
                if let error = viewModel.requestError {
                    ErrorView(errorMessage: error.rawValue, tryAgainCallback: viewModel.fetchData)
                } else if viewModel.isLoading == true {
                    loaderView
                } else {
                    List(viewModel.repositories) { item in
                        NavigationLink(destination: RepositoryDetailsView(repository: item)) {
                            RepositoryView(repository: item)
                        }
                    }
                    .listStyle(.plain)
                }
                
            }
            .navigationTitle("Repositories")
        }
        .navigationViewStyle(.stack)
    }
}

struct ErrorView: View {
    var errorMessage: String
    var tryAgainCallback: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text(errorMessage)
                .multilineTextAlignment(.center)
            Button("Try Again", action: tryAgainCallback)
                .padding(4)
            Spacer()
        }
        .padding()
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        let view =  RepositoryListView()
    
        view.viewModel.repositories  = [
            .mocked, .mocked, .mocked, .mocked
        ]
        
        //view.viewModel.isLoading = false
        
        return view
    }
}
