//
//  NumericInfoView.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct NumericInfoView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .font(.title3)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
                .foregroundColor(.discretGray)
        }
    }
}

struct NumericInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NumericInfoView(title: "Issues", value: 10)
            .previewLayout(.fixed(width: 100, height: 60))
    }
}
