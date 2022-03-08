//
//  HomeSearch.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeSearch: View {
    var body: some View {
        NavigationLink(destination: SearchView()) {
            TextField("Tìm kiếm...", text: .constant(""))
                .multilineTextAlignment(.leading)
                .font(.custom(.customFont, size: 16))
                .foregroundColor(Color("Primary"))
                .frame(height: 50)
                .padding(.leading, 50)
                .background(Color("Primary").opacity(0.07))
                .cornerRadius(30)
                .overlay(
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("Primary"))
                        .padding()
                    
                    ,alignment: .leading
                    
                )
                .disabled(true)
        }
    }
}

struct HomeSearch_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            HomeView()
            
        }
    }
}
