//
//  URLProviders.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import Foundation

protocol URLProvider{
    var url: URL? { get }
}

struct FullURLSpecified: URLProvider {
    let url: URL?
    
    init(path: String) {
        self.url = URL(string: path)
    }
}
  
let baseAPIUrl = "https://api.github.com"

struct SearchAPIUrlProvider: URLProvider {
    let url: URL?
    
    init(endpoint: Endpoint) {
        // url = SearchAPIUrlProvider.buildUrl(with: endpoint)
        url = Self.buildUrl(with: endpoint)
    }
    
    static func buildUrl(with endpoint: Endpoint) -> URL? {
        guard var url = URL(string: baseAPIUrl) else {
            return nil
        }

        url.appendPathComponent("search")
        url.appendPathComponent("repositories")
        
        endpoint.query.forEach { (name, value) in
            url.append(name, value: value)
        }
        
        return url
    }
    
    enum Endpoint {
        case search(language: String)
        case searchByText(text: String)
        
        var query: [(String, String)] {
            switch self {
            case .search(let language):
                return [
                    ("q", "language:\(language)"), ("sort", "stars")
                ]
            case .searchByText(let text):
                return [
                    ("q", text), ("sort", "stars")
                ]
            }
        }
    }
}
