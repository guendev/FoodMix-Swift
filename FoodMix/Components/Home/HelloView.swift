//
//  HelloView.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HelloView: View {
    
    @EnvironmentObject var app: AppViewModel
    
    @AppStorage("welcome") var welcome: Bool = true
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text("Xin Chào")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(Color("TextTitle"))
                                    
                Text("\(app.user?.name ?? "Đầu Bếp")")
                    .font(.custom(.customFont, size: 20))
                    .foregroundColor(Color("TextTitle"))
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            NavigationLink(destination: ProfileView(slug: app.user?.slug ?? "")) {
                Group {
                    if app.auth {
                        RecipeAvatar(avatar: app.user?.avatar)
                    } else {
                        Image("avatar")
                            .resizable()
                    }
                }
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
            .withAuth()
            
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            HomeView()
            
        }
        
    }
}
