//
//  LanguageUsageIndicator.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct LanguageUsageIndicator: View {
    let languageRatio: LanguageRatio
   
    private let colors = [Color.mainPurple, Color.openGreen, Color.closedRed]
    private let width = 350.0
    
    init(languageRatio: LanguageRatio) {
        let sorted = languageRatio.sorted(by: >)
        let mostUsed = sorted[0..<(sorted.count > 3 ? 3 : sorted.count)]
        
        self.languageRatio = Dictionary(uniqueKeysWithValues: mostUsed.map {
            ($0.key, $0.value)
        })
    }
    
    var valueColors: [String: Color] {
        var colorIndex = 0
        return Dictionary<String, Color>(uniqueKeysWithValues: languageRatio.map {
            let tuple = ($0.key, colors[colorIndex])
            colorIndex += 1
            return tuple
        })
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                ForEach(languageRatio.sorted(by: >), id: \.key) { key, value in
                    VStack {}
                    .frame(width: CGFloat(value.percentage * (self.width / 100)), height: 10)
                    .background(valueColors[key])
                }
            }
            .cornerRadius(10)
            
            HStack() {
                ForEach(languageRatio.sorted(by: >), id: \.key) { key, value in
                    HStack {
                        Text("\(value.percentage.format(precision: 2))%")
                            .font(.subheadline)
                            .foregroundColor(valueColors[key])
                            .minimumScaleFactor(0.5)
                            
                        Text(key)
                            .font(.subheadline)
                            .foregroundColor(.description)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
        }
        .frame(width: CGFloat(width))
    }
}

struct LanguageUsageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LanguageUsageIndicator(languageRatio: ["Swift": 60, "Ruby": 10, "Shell": 30])
    }
}
