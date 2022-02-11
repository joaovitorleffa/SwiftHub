//
//  SearchBarView.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField("Search...", text: $text)
                .textCase(.none)
                .disableAutocorrection(true)
            
            Button {
                text = ""
            } label: {
                Image(systemName: "multiply.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .padding(8)
        .background(Color.mainPurple.opacity(0.2))
        .cornerRadius(10)
        .padding(.vertical, 8)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(text: .constant(""))
                .previewLayout(.fixed(width: 375, height: 60))
            SearchBarView(text: .constant("Swift"))
                .previewLayout(.fixed(width: 375, height: 60))
        }
    }
}
