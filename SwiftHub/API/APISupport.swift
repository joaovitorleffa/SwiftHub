//
//  APISupports.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import Foundation

public enum APIError: String, Error {
    case malformedURL
    case apiError = "Something went wrong"
    case invalidResponse
    case noData = "No data found"
    case decodeError
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { data, response, error in
            if let error = error {
                result(.failure(error))
                return
            }
            
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                
                result(.failure(error))
                return
            }

            result(.success((response, data)))
        }
    }
}

extension URL {
    mutating func append(_ queryItem: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        
        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)
        
        // Append the new query item in the existing query items array
        queryItems.append(queryItem)
        
        // Append update query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Returns the url from new url components
        self = urlComponents.url!
    }
}
