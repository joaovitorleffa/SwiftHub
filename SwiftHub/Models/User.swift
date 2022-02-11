//
//  User.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import Foundation

struct User: Decodable {
    let name: String
    let bio: String?
    let pictureURL: String
    let profileURL: String
    let email: String?
    let blog: String?
    let followers: Int
    let following: Int
    let repos: Int
    let type: UserType

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case bio
        case pictureURL = "avatar_url"
        case profileURL = "url"
        case email
        case blog
        case followers
        case following
        case repos = "public_repos"
        case type
    }
    
    enum UserType: String, Decodable {
        case user = "User"
        case organization = "Organization"
    }
}
