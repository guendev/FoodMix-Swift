//
//  RecipeAuthorView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeAuthorView: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        Group {
            
            if viewModel.recipe != nil {
                
                HStack(spacing: 15) {
                    
                    RecipeAvatar(avatar: viewModel.recipe?.user?.avatar)
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text(viewModel.recipe?.user?.name ?? "")
                            .font(.custom(.customFont, size: 19))
                        
                        Text("120 Công thức")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            
                            Text("4.5")
                                .foregroundColor(.black.opacity(0.7))
                            
                            
                            StarRating(rating: 4.5, size: 13, spacing: 3)
                            
                        }
                        
                        Text("120 Đánh giá")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                }
                
            } else {
                EmptyView()
            }
            
        }
    }
}

struct RecipeAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeAuthorView()
    }
}
