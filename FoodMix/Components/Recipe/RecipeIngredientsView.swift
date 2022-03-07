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
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)))
                        .cornerRadius(5)
                        
                    }
                    
                }
                
            }
            
        }
    }
}

