//
//  Date+format.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import Foundation

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
        
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateStyle = .short
        formatter.setLocalizedDateFormatFromTemplate("dd/MM/yy")
        
        return formatter.string(from: self)
    }
}
