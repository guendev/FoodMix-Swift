//
//  RecipeView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeView: View {
    
    @StateObject var viewModel: RecipeViewModel = RecipeViewModel()
        
    var body: some View {
        
        ScrollView {
            
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
        .background(Color.white.ignoresSafeArea())
        .overlay(
            RecipeAppBar()
            
            ,alignment: .top
        )
        .onAppear {
            
            viewModel.getRecipe("12345")
            
        }
        // .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
        .environmentObject(viewModel)
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
