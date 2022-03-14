//
//  RecipeView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeView: View {
    
    var recipe: Recipe
    
    @StateObject var viewModel: RecipeViewModel = RecipeViewModel()
        
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(spacing: 0) {
                
                RecipeStretchAvatar()
                
                VStack(spacing: 25) {
                    
                    RecipeAuthorView()
                    
                    
                    RecipeAbout()
                                        
                    RecipeIngredientsView()
                    
                    RecipeStepperView()
                    
                }
                .offset(y: -20)
                .padding(.horizontal, 25)
                
            }
    
            
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Color("Background").ignoresSafeArea())
        .overlay(
            RecipeAppBar()
            
            ,alignment: .top
        )
        .onAppear {
            
            viewModel.getRecipe(recipe.slug)
        }
        .asyncAuthData(auth: $viewModel.auth, currentUser: $viewModel.currentUser)
        .environmentObject(viewModel)
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(recipe: Recipe(id: "6211e6447d3b441181c395da", name: "Lê Thị Kim Ngân", slug: "le-thi-kim-ngan", avatar: "https://cdn.tgdd.vn/2021/03/CookProduct/bunmocchangio-1200x676.jpg"))
            
        }
    }
}
