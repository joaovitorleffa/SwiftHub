//
//  UserDetailsViewModel.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import Foundation 

class UserDetailsViewModel: ObservableObject {
    @Published var user: User?
    
    init(url: String) {
        fetchData(with: url)
    }
    
    func fetchData(with url: String) {
        Requester.request(with: .init(path: url)) { (result: Result<User, APIError>) in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
