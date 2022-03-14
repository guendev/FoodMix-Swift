//
//  RecipeIngredientsView.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct RecipeIngredientsView: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Nguyên Liệu") {
                
                
                if viewModel.recipe != nil && viewModel.recipe!.ingredients!.count > 5 {
                    
                    Text("Xem thêm")
                        .font(.custom(.customFont, size: 14))
                        .foregroundColor(.gray)
                    
                }
                
            }
            
            if viewModel.recipe != nil {
                
                LazyVStack(spacing: 15){
                    
                    ForEach(viewModel.recipe!.ingredients!.prefix(5), id:\.id) { item in
                        
                        HStack {
                            
                            Text(item.name)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(item.count) \(item.unit)")
                            
                        }
                        .font(.subheadline)
                        .foregroundColor(Color("TextContent"))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color("Background2"))
                        .cornerRadius(5)
                        
                    }
                    
                }
                
            }
            
        }
    }
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(recipe: Recipe(id: "6211e6447d3b441181c395da", name: "Lê Thị Kim Ngân", slug: "le-thi-kim-ngan", avatar: "https://cdn.tgdd.vn/2021/03/CookProduct/bunmocchangio-1200x676.jpg"))
            
        }
    }
}

