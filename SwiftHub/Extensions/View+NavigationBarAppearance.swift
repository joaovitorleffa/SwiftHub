//
//  View+NavigationBarAppearance.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import SwiftUI

extension View {
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.backgroundColor = .mainPurple
    
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
