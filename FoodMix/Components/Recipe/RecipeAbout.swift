//
//  RecipeAbout.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeAbout: View {
    
    @State var limitLine: Bool = false
    
    @State var string: CGFloat = .zero
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Giới Thiệu") {}
            
            Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
                .font(.subheadline)
                .lineSpacing(6)
                .foregroundColor(Color("TextContent"))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: limitLine ? 200: nil)
                .clipped()
            
        }
        
    }
}

struct RecipeAbout_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(recipe: Recipe(id: "6211e6447d3b441181c395da", name: "Lê Thị Kim Ngân", slug: "le-thi-kim-ngan", avatar: "https://cdn.tgdd.vn/2021/03/CookProduct/bunmocchangio-1200x676.jpg"))
            
        }
    }
}
