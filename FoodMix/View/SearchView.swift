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
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                            
                            if viewModel.loading {
                                
                                ListPlaceholder()
                                
                            }
                            
                        }
                    }
                    
                }
                .transition(.opacity)
                
            }
            .padding(.horizontal, 25)
            
        }
        .environmentObject(viewModel)
        
    }
    
    @ViewBuilder
    private func ListPlaceholder() -> some View {
        Group {
            
            ForEach(1...3, id: \.self) { _ in
                
                RecipeItemHorizontalPreview()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                
            }
            
        }
        .redacted(reason: .placeholder)
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            SearchView()
            
        }
    }
}
