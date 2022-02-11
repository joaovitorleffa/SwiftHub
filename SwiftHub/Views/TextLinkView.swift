//
//  TextLinkView.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct TextLinkView: View {
    var prefix: String? = nil
    let title: String?
    let action: () -> Void
    
    var body: some View {
        if let title = title {
            HStack(spacing: 6) {
                if let prefix = prefix {
                    Text(prefix).foregroundColor(.discretGray)
                }
                Button(action: action) {
                    Text(title).underline()
                }
                .foregroundColor(.mainPurple)
            }
            
        } else {
            EmptyView()
        }
    }
}

struct TextLinkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextLinkView(prefix: "By:", title: "email@email.com", action: {})
            TextLinkView(title: "email@email.com", action: {})
        }
        .previewLayout(.fixed(width: 300, height: 40))
    }
}
