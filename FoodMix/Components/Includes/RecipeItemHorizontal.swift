//
//  RecipeItemHorizontal.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct RecipeItemHorizontal: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            RecipeAvatar(avatar: recipe.avatar)
                .scaledToFill()
                .frame(width: 140, height: 100)
                .clipped()
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(recipe.name)
                    .font(.custom(.customFont, size: 17))
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                StarRating(rating: 3.4, size: 13)
                
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ")
                    .font(.custom(.customFont, size: 14))
                    .lineSpacing(5)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
        
    }
}


struct RecipeItemHorizontalPreview: View {
        
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image("food")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 100)
                .clipped()
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Lợn Xào Sả Ớt")
                    .font(.custom(.customFont, size: 17))
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                StarRating(rating: 3.4, size: 13)
                
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ")
                    .font(.custom(.customFont, size: 14))
                    .lineSpacing(5)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
        
    }
    
    static func preview() -> some View {
        
        Group {
            
            ForEach(1...3, id: \.self) { _ in
                
                RecipeItemHorizontalPreview()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                
            }
            
        }
        .redacted(reason: .placeholder)
        
    }
}



struct RecipeItemHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItemHorizontal(recipe:
                                Recipe(
                                    id: "1",
                                    name: "Lợn Xào Sả Ớt",
                                    slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg"
                                )
        )
            .previewLayout(.sizeThatFits)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("Background"))
    }
}
