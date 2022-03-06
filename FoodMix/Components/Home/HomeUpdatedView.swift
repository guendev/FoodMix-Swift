//
//  HomeUpdatedView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct HomeUpdatedView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @State var getFirst: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            TitleView(title: "Công Thức Mới") {
                Text("Xem thêm")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
            }
            
            VStack(spacing: 25) {
                
                ForEach(viewModel.updatedRecipes, id:\.id) { item in
                    
                    RecipeItemHorizontal(recipe: item)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                    
                }
                
            }
        }
        .onAppear {
            
            if getFirst {
                return
            }
            getFirst = true
            
            viewModel.getUpdateRecipes()
            
        }
    }
}

struct HomeUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
