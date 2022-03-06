//
//  HomeIngredient.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeIngredient: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
        
    @State var showSheet: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            TitleView(title: "Nguyên Liệu") {
                Text("Xem thêm")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20) {
                    
                    ForEach(viewModel.ingredients, id: \.id) { item in
                        
                        Button {
                            
                            withAnimation {
                                viewModel.currentIngredient = item
                                showSheet = true
                            }
                            
                        } label: {
                            
                            VStack(spacing: 13) {
                                
                                RecipeAvatar(avatar: item.image)
                                    .scaledToFit()
                                    .frame(height: 60)
                                
                                Text(item.name)
                                    .font(.custom(.customFont, size: 15))
                                    .foregroundColor(.gray)
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    
                }
            }
            
        }
        .onAppear {
            viewModel.getIngredients()
        }
        .sheet(isPresented: $showSheet) {
            IngredientView(ingredient: viewModel.currentIngredient!)
        }
        
    }
}

struct HomeIngredient_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
