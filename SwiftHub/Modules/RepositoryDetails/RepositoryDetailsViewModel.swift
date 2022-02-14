//
//  RepositoryDetailsViewModel.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import Combine
import Foundation
import SwiftUI

class RepositoryDetailsViewModel: ObservableObject {
    @Published var languageDistribution: LanguageDistribution = [:]
    @Published var languageRatio: LanguageDistribution = [:]
    
    let repository: Repository
    var subscriptions: Set<AnyCancellable> = []
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func viewAppeared() {
        CombineRequester.request(with: .init(path: repository.languagesUrl))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [unowned self] (result: LanguageDistribution) in
                self.languageDistribution = result.calculateRatio()
            }
            .store(in: &subscriptions)
    }
}
