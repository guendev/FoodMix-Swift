//
//  CategoryView.swift
//  FoodMix
//
//  Created by Yuan on 03/03/2022.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel: CategoryViewModel = CategoryViewModel()
    
    var category: Category
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                CategoryStretchView()
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    CategoryAboutView()
                    
                    Group {
                        
                        TitleView(title: "Món Ăn") {
                            
                            Text("Bộ lọc")
                                .font(.custom(.customFont, size: 14))
                                .foregroundColor(.gray)
                            
                        }
                        
                    }
                    
                    VStack(spacing: 10) {
                        
                        ForEach(viewModel.recipes, id:\.id) { item in
                            
                            RecipeItemHorizontal(recipe: item)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                            
                        }
                        
                    }
                    
                }
                .offset(y: -25)
                .padding(.horizontal, 25)
                
            }
            
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Color.white.ignoresSafeArea())
        .overlay(
            
            AppBar(title: "\(category.name)", back: true, animation: viewModel.offset < -150) {
                
            }
            .padding(.horizontal, 25)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: -5)
            .foregroundColor(.white)
            .background(
                Color("Primary")
                    .opacity(viewModel.offset < -150 ? 1 : 0)
                    .ignoresSafeArea()
            )
            .animation(.easeIn)
            
            ,alignment: .top
            
        )
        .onAppear {
            
            DispatchQueue.main.async {
                viewModel.category = category
                
                viewModel.getRecipes()
            }
            
            
        }
        .environmentObject(viewModel)
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(id: "1", name: "Gà Quay", slug: "ga-quay", avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFKYmf6jHItCbfL8txsSCFfsCW254JYLEeNQ&usqp=CAU", content: "", icon: ""))
    }
}
