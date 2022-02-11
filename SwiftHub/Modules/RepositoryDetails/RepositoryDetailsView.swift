//
//  RepositoryDetailsView.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct RepositoryDetailsView: View {
    @ObservedObject var viewModel: RepositoryDetailsViewModel
    let repository: Repository
    let language: Language?
    
    init(repository: Repository) {
        self.repository = repository
        self.language = .init(name: repository.language)
        self.viewModel = .init(repository: repository)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let language = language {
                PillView(language: language, isSelected: true)
            } else {
                Text(repository.language ?? "Not found language.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.mainPurple)
            }
            
            Spacer().frame(height: 20)
            
            Text(repository.description ?? "No description.")
            
            Spacer().frame(height: 20)
            
            Group {
                TextLinkView(prefix: "By:", title: repository.owner.name) { }
                TextLinkView(prefix: "License:", title: repository.license?.name) { }
                TextLinkView(title: repository.webPage) {  }
            }
            
            Spacer()
            
            DateView(prefix: "created at", date: repository.created)
            DateView(prefix: "last update at", date: repository.lastUpdated)
            
            Spacer()
            
            HStack {
                NumericInfoView(title: "whatchers", value: repository.watchers)
                Spacer()
                NumericInfoView(title: "open issues", value: repository.openIssues)
                Spacer()
                NumericInfoView(title: "forks", value: repository.forks)
            }
        }
        .navigationTitle(repository.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding(40)
        .onAppear(perform: viewModel.viewAppeared)
    }
}

struct DateView: View {
    let prefix: String
    let date: Date
    
    var body: some View {
        HStack {
            Text(prefix)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.discretGray)
            Spacer()
            Text(date.formatted)
        }
    }
}

struct RepositoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailsView(repository: .mocked)
    }
}
