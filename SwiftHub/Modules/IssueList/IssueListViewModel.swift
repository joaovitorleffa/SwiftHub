//
//  IssueListViewModel.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import Foundation
import Combine

class IssueListViewModel: ObservableObject {
    @Published var issues: [Issue] = []
    
    let repository: Repository
    
    var subscriptions: Set<AnyCancellable> = []
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func viewAppeared() {
        CombineRequester.request(with: .init(path: repository.issuesUrl.replacingOccurrences(of: "{/number}", with: "")))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [unowned self] (result: [Issue]) in
                self.issues = result
            }
            .store(in: &subscriptions)
    }
}
