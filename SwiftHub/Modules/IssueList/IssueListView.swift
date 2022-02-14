//
//  IssueListView.swift
//  SwiftHub
//
//  Created by joaovitor on 14/02/22.
//

import SwiftUI

struct IssueListView: View {
    @ObservedObject var viewModel: IssueListViewModel
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
        self.viewModel = .init(repository: repository)
    }
    
    
    var body: some View {
        List(viewModel.issues) { item in
            NavigationLink(destination: IssueDetailsView(issueUrl: item.url, issueNumber: item.number)) {
                IssueView(issue: item)
            }
        }
        .listStyle(.plain)
        .onAppear(perform: viewModel.viewAppeared)
    }
}

struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        IssueListView(repository: .mocked)
    }
}
