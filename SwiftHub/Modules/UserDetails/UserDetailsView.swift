//
//  UserDetailsView.swift
//  SwiftHub
//
//  Created by joaovitor on 11/02/22.
//

import SwiftUI

struct UserDetailsView: View {
    @ObservedObject var viewModel: UserDetailsViewModel
    @Binding var isPresented: Bool
    
    init(url: String, isPresented: Binding<Bool>) {
        viewModel = .init(url: url)
        // isPresented: Bool
        // _isPresented: Binding<Bool>
        self._isPresented = isPresented
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let user = viewModel.user {
                    UserDetailsBody(user: user)
                } else {
                    EmptyView()
                }
            }
            .navigationTitle(viewModel.user?.type.rawValue ?? "Organization")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                isPresented = false
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }))
        }
    }
}

struct UserDetailsBody: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedImage(url: user.pictureURL, size: 190)
            Text(user.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text(user.bio ?? "No bio.")
                .font(.body)
                .foregroundColor(.description)
                .multilineTextAlignment(.center)
            TextLinkView(title: user.email) { }
            TextLinkView(title: user.blog) { }
            Spacer()
            HStack {
                NumericInfoView(title: "repos", value: user.repos)
                Spacer()
                NumericInfoView(title: "followers", value: user.followers)
                Spacer()
                NumericInfoView(title: "following", value: user.following)
            }
        }
        .padding()
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let view = UserDetailsView(url: mockUserURL, isPresented: .constant(false))
        view.viewModel.user = .mocked
        
        return view
    }
}
