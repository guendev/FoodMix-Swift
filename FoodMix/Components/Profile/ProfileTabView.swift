//
//  ProfileTabView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct ProfileTabView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    @Namespace var animetion
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Hoạt Động")
                    .font(.custom(.customFont, size: 22))
                    .foregroundColor(.black.opacity(0.8))
                
                Spacer()
                
                
                HStack {
                    
                    TabActiveView(title: "Công Thức", tab: ProfileTab.Recipes)
                    
                    TabActiveView(title: "Đánh Giá", tab: ProfileTab.Reviews)
                    
                }
                
            }
            
        }
        
    }
    
    @ViewBuilder
    private func TabActiveView( title: String,  tab: ProfileTab) -> some View {
        Button {
            
            withAnimation(.spring()) {
                
                viewModel.currentTab = tab
                
            }
            
        } label: {
            
            Text(title)
                .font(.caption)
                .foregroundColor(viewModel.currentTab == tab ? .black.opacity(0.8) : .gray)
                .overlay(
                    
                    Group {
                        
                        if viewModel.currentTab == tab {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 3)
                                .offset(y: 6)
                                .matchedGeometryEffect(id: "PROFILE_TAB", in: animetion)
                            
                        }
                        
                    }
                    
                    ,alignment: .bottom
                    
                )
            
        }
    }
    
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: "1", name: "Yuan", slug: "yuan", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jp"))
    }
}
