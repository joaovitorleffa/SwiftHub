//
//  RepositorySearchViewModel.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import Combine
import Foundation

class RepositorySearchViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var searchText: String = ""
    /* Quando a classe `RepositorySearchViewModel` (referência) não existir mais na memória, todas as subscriptions que estão relacionadas
     a propriedade `subscription` da classe serão removidas da memória. */
     var subscriptions: Set<AnyCancellable> = []
    var teste = ""
    
    init() {
        $searchText
            // a cada 500 ms publica o evento
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            // a primeira publicação não é executada
            .dropFirst()
            .sink { [unowned self] value in
                self.search()
            }
            .store(in: &subscriptions)
    }
    
    private func search() {
        CombineRequester.request(search: .init(endpoint: .searchByText(text: searchText)))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { (result: SearchResult) in // aqui é definido o Tipo genérico `T` da função `request<T: Decodable>(...)`
                self.repositories = result.items
            }
            .store(in: &subscriptions)

    }
}
