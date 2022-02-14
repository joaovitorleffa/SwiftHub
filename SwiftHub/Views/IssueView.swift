//
//  IssueView.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import SwiftUI

struct IssueView: View {
    let issue: Issue
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(issue.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                Spacer()
                if issue.locked == true {
                    Image(systemName: "archivebox.circle")
                        .foregroundColor(.closedRed)
                        .frame(width: 40)
                } else {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.openGreen)
                        .frame(width: 40)
                }
            }
            
            if let body = issue.body {
                Spacer().frame(height: 8)
                Text(body)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(.description)
            }
            
            Spacer().frame(height: 8)
            
            HStack {
                InfoView(title: issue.created.formatted, description: "creation date")
                Spacer()
                InfoView(title: issue.user.name, description: "creator")
                Spacer()
                InfoView(title: "\(issue.comments)", description: "comments")
            }
        }
        .padding()
    }
}

struct InfoView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.body)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.description)
        }
    }
}

struct IssueView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IssueView(issue: .mocked)
                .previewLayout(.fixed(width: 375, height: 150))
            IssueView(issue: .mocked)
                .previewLayout(.fixed(width: 375, height: 150))
            IssueView(issue: .mocked)
                .previewLayout(.fixed(width: 375, height: 150))
        }
    }
}
