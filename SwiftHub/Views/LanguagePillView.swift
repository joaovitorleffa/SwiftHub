//
//  LanguagePillView.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import SwiftUI

struct LanguagePillView: View {
    @EnvironmentObject var viewModel: RepositoryListViewModel
    let language: Language
    
    var isSelected: Bool {
        viewModel.selectedLanguage == language
    }
    
    var body: some View {
        PillView(language: language, isSelected: isSelected)
            .onTapGesture {
                viewModel.selectedLanguage = language
            }
    }
}

struct PillView: View {
    let language: Language
    let isSelected: Bool
    
    var fontWeight: Font.Weight {
        isSelected ? .bold : .regular
    }
    
    var opacity: Double {
        isSelected ? 1 : 0.4
    }
    
    var borderWidth: CGFloat {
        isSelected ? 1 : 0.8
    }
    
    var body: some View {
        HStack {
            Image(language.rawValue)
            Text(language.rawValue)
                .font(.subheadline)
                .fontWeight(fontWeight)
        }
        .opacity(opacity)
        .frame(width: 100, height: 35)
        .overlay(RoundedRectangle(cornerRadius: 35 / 2).stroke(Color.mainPurple, lineWidth: borderWidth))
        
    }
}

struct LanguagePillView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: RepositoryListViewModel = .init()
        viewModel.selectedLanguage = .swift
        
        return Group {
            LanguagePillView(language: .swift)
                .previewLayout(.fixed(width: 200, height: 50))
            LanguagePillView(language: .kotlin)
                .previewLayout(.fixed(width: 200, height: 50))
            LanguagePillView(language: .java)
                .previewLayout(.fixed(width: 200, height: 50))
            LanguagePillView(language: .objc)
                .previewLayout(.fixed(width: 200, height: 50))
        }
        .environmentObject(viewModel)
    }
}
