//
//  LanguageDistribution+Percentage.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import Foundation
import SwiftUI

typealias LanguageDistribution = [String: Double]
typealias LanguageRatio = [String: Double]

extension LanguageDistribution {
    var lineCount: Double {
        self.reduce(0) { $0 + $1.value }
    }
    
    func calculateRatio() -> LanguageRatio {
        Dictionary(uniqueKeysWithValues: self.map {
            ($0.key, $0.value / self.lineCount)
        })
    }
}
