//
//  RepositoryView.swift
//  SwiftHub
//
//  Created by joaovitor on 10/02/22.
//

import SwiftUI

struct RepositoryView: View {
    let repository: Repository
    @State private var userDetailPresented = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(repository.name)
                    .font(.title2)
                     .fontWeight(.bold)
                
                Text(repository.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.discretGray)
                    .minimumScaleFactor(0.8)
                    .lineLimit(2)
                
                Spacer()
                
                Text("\(repository.starCount) ⭐️")
                    .font(.footnote)
            }
            
            Spacer()
            
            VStack {
                RoundedImage(url: repository.owner.pictureURL, size: 60)
                Text(repository.owner.name)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                    .frame(maxWidth: 70 )
            }
            .onTapGesture {
                userDetailPresented = true
            }
            // cria um binding com a tela UserDetailsView
            .sheet(isPresented: $userDetailPresented) {
                UserDetailsView(url: repository.owner.profileURL, isPresented: $userDetailPresented)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .padding(.all, 10)
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(repository: .mocked)
            .previewLayout(.fixed(width: 385, height: 100))
    }
}
