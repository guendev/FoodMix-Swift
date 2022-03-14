//
//  SearchView.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
        
    var body: some View {
        
        VStack(spacing: 25) {
            
            SearchBarView()
            
            ScrollView {
                
                ZStack {
                    
                    if viewModel.keyword.isEmpty {
                        SearchHistoryView()
                    } else if !viewModel.loading && viewModel.recipes.isEmpty {
                        
                        // trống ko có công thức
                        VStack {
                            
                            Image("empty")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 280, height: 280)
                            
                            Text("Chẳng có món ăn nào ở đây cả")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }
                        
                    } else {
                        // dg tải || show
                        VStack(spacing: 25) {
                            
                            TitleView(title: "Kết Quả") {}
                            
                            ForEach(viewModel.recipes, id:\.id) { item in
                                
                                NavigationLink( destination: RecipeView(recipe: item)) {
                                    
                                    RecipeItemHorizontal(recipe: item)
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                            
                            if viewModel.loading {
                                
                                RecipeItemHorizontalPreview.preview()
                                
                            }
                            
                        }
                    }
                    
                }
                .transition(.opacity)
                
            }
            .padding(.horizontal, 25)
            
        }
        .background(Color("Background").ignoresSafeArea())
        .environmentObject(viewModel)
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            SearchView()
            
        }
    }
}
