//
//  ProfileView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    var user: User
    
    var body: some View {
        ScrollView {
            
            ProfileStretchView()
            
            VStack(spacing: 25) {
                
                ProfileAboutView()
                
                ProfileTabView()
                
            }
            .padding(.horizontal, 25)
            
            
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            
            AppBar(title: "Kim Ngân", back: true, animation: viewModel.offset < -150) {
                
            }
            .padding(.horizontal, 25)
            .background(
                Color("Primary")
                    .opacity(viewModel.offset < -150 ? 1 : 0)
                    .ignoresSafeArea()
            )
            .foregroundColor(.white)
            .animation(.easeIn)
            
            ,alignment: .top
            
        )
        .onAppear {
            
            viewModel.user = user
            
        }
        .environmentObject(viewModel)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: "1", name: "Yuan", slug: "yuan", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jp"))
    }
}
