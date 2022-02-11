//
//  Language.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import Foundation

enum Language: String, CaseIterable {
    case swift
    case kotlin
    case java    
    case objc = "obj-c"

    init?(name: String?) {
        guard let name = name else {
            return nil
        }
        
        guard name == "Objective-C" else {
            self.init(rawValue: name.lowercased())
            return
        }
        
        self = .objc
    }
}
