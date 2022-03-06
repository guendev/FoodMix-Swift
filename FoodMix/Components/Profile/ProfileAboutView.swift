//
//  ProfileAboutView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct ProfileAboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Thịt Kho")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black.opacity(0.8))
                .frame(maxWidth: getScreenBounds().width - 170, alignment: .leading)
            
            HStack(spacing: 30) {
                
                Text("@yuan")
                    .lineLimit(1)
                
                HStack(spacing: 5) {
                    
                    Image(systemName: "mappin")
                    
                    Text("Huế")
                    
                }
                
                HStack {
                    
                    Image(systemName: "calendar")
                    
                    Text("20/20/2022")
                    
                }
                
            }
            .font(.custom(.customFont, size: 17))
            .foregroundColor(.gray)
            
            Text("I have a SwiftUI App which uses a public API to download cocktail data by name but I am not very familiar with SwiftUI and I cannot see a way of initialising my view model in my DetailsView file.")
                .font(.custom(.customFont, size: 17))
                .foregroundColor(.black.opacity(0.7))
                .lineSpacing(7)
            
        }
    }
}

struct ProfileAboutView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: "1", name: "Yuan", slug: "yuan", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"))
    }
}
