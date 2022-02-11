//
//  SearchResults.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import Foundation

struct SearchResult: Decodable {
    let totalCount: Int
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
