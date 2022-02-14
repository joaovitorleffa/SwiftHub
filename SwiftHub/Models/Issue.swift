//
//  Issue.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import Foundation

struct Issue: Decodable, Identifiable {
    let id: Int
    let number: Int
    let url: String
    let title: String
    let body: String?
    let locked: Bool
    let created: Date
    let comments: Int
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case number
        case url = "html_url"
        case title
        case body
        case locked
        case created = "created_at"
        case comments
        case user
    }
    
    struct User: Decodable {
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case name = "login"
        }
    }
}
