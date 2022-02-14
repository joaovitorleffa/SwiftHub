//
//  IssueDetailsView.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import SwiftUI

struct IssueDetailsView: View {
    let issueUrl: String
    let issueNumber: Int
    
    var body: some View {
        VStack {
            WebView(url: URL(string: issueUrl))
        }
        .navigationTitle(Text("Issue \(issueNumber)"))
        
    }
}

struct IssueDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetailsView(issueUrl: "https://api.github.com/repos/vsouza/awesome-ios/issues/3071", issueNumber: 200)
    }
}
