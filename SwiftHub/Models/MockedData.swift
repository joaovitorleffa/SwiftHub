//
//  MockedData.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import Foundation

let babyCorgiPic = "https://static.boredpanda.com/blog/wp-content/uploads/2020/08/CBr78muJnaq-png__700.jpg"
let mockUserURL = "https://api.github.com/users/AFNetworking"

let userSrc = """
{
  "login": "Baby Corgi",
  "avatar_url": "\(babyCorgiPic)",
  "url": "https://api.github.com/users/AFNetworking",
  "type": "Organization",
  "name": "AFNetworking",
  "blog": "http://afnetworking.com",
  "email": "info@alamofire.org",
  "bio": "A delightful iOS and OS X networking framework",
  "public_repos": 22,
  "followers": 0,
  "following": 0,
  "created_at": "2011-11-08T19:08:12Z",
  "updated_at": "2015-04-27T20:37:08Z"
}
"""

extension Repository {
    static var mocked: Repository {
        Repository(id: 1000,
                   owner: .init(name: "Baby Corgi", pictureURL: babyCorgiPic, profileURL: mockUserURL),
                   name: "AFNetworking",
                   description: "A delightful blabber; a 5-month-old pup who can't stay still, constantly making everyone around her smile like idiots",
                   starCount: 200,
                   language: "Português",
                   webPage: "www.github.com",
                   languagesUrl: "www.github.com",
                   issuesUrl: "https://api.github.com/repos/vsouza/awesome-ios/issues",
                   watchers: 100,
                   openIssues: 2,
                   forks: 30,
                   license: .init(name: "Mitch", url: mockUserURL),
                   created: .init(timeIntervalSinceReferenceDate: 0),
                   lastUpdated: Date())
    }
}

extension User {
    static var mocked: User? {
        guard let json = userSrc.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(User.self, from: json)
    }
}

extension Issue {
    static var mocked: Issue {
        Issue(
            id: 1,
            number: 200,
            url: "https://api.github.com/repos/vsouza/awesome-ios/issues/3071",
            title: "Add IParallaxAndHapticEffect",
            body: "<!--- Provide a general summary of your changes in the Title above -->\r\n\r\n## Project URL\r\n<!--- The project URL -->\r\nhttps://github.com/Omilr/IParallaxAndHapticEffect.git\r\n\r\n## Category\r\n<!--- Category in AwesomeiOS where the project will be added -->\r\nAnimation\r\n\r\n## Description\r\n<!--- Describe your changes in detail -->\r\n### Animation\r\n- [IParallaxAndHapticEffect](https://github.com/Omilr/IParallaxAndHapticEffect.git) - ✨ Super easy Parallax and Haptic Effect.\r\n\r\n## Why it should be included to `awesome-ios` (mandatory)\r\nIos has many amazing UX features. Among them, I wanted to introduce it to many people by providing an integrated haptic function and Parallax function that is not well known. The purpose is the same as 'awesome-ios'.🙌🏻\r\n\r\n## Checklist\r\n<!--- Go over all the following points, and put an `x` in all the boxes that apply. -->\r\n<!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->\r\n- [ ] Has 50 GitHub stargazers or more\r\n- [x] Only one project/change is in this pull request\r\n- [x] Isn't an archived project\r\n- [ ] Has more than one contributor\r\n- [x] Has unit tests, integration tests or UI tests\r\n- [ ] Addition in chronological order (bottom of category)\r\n- [x] Supports iOS 9 / tvOS 10 or later\r\n- [x] Supports Swift 4 or later\r\n- [x] Has a commit from less than 2 years ago\r\n- [x] Has a **clear** README in English\r\n",
            locked: false,
            created: Date(),
            comments: 1,
            user: User(name: "João Vitor"))
    }
}
