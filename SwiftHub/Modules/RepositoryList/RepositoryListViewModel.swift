//
//  RepositoryListViewModel.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import SwiftUI

class RepositoryListViewModel: ObservableObject { 
    @Published var repositories: [Repository] = []
    @Published var isLoading = false
    @Published var requestError: APIError?
    @Published var selectedLanguage: Language = .swift {
        didSet {
            fetchData()
        }
    }
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let provider = SearchAPIUrlProvider(endpoint: .search(language: selectedLanguage.rawValue))
        self.isLoading = true
        
        Requester.request(search: provider) { [weak self] (result: Result<SearchResult, APIError>) in
            switch result {
            case .success(let searchResult):
                DispatchQueue.main.async {
                    self?.repositories = searchResult.items
                    self?.isLoading = false
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.requestError = error
                }
            }
        }
    }
}
