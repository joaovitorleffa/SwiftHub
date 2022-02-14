//
//  Double+Format.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import Foundation

extension Double {
    func format(precision: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = precision
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
