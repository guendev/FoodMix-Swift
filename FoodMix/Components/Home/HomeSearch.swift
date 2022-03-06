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
                .font(.custom(.customFont, size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                .frame(height: 50)
                .padding(.leading, 50)
                .background(Color("Ultramarine Blue").opacity(0.08))
                .cornerRadius(30)
                .overlay(
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 0.4117647059, green: 0.3960784314, blue: 0.8156862745, alpha: 1)))
                        .padding()
                    
                    ,alignment: .leading
                    
                )
                .disabled(true)
        }
    }
}

struct HomeSearch_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearch()
    }
}
