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
                    
                    NavigationLink( destination: RecipeView(recipe: item)) {
                        
                        RecipeItemHorizontal(recipe: item)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                
                if viewModel.loadingUpdated {
                    
                    ListPlaceholder()
                    
                }
                
                
                if !viewModel.emptyUpdated {
                    Button {
                        
                        viewModel.getUpdateRecipes()
                        
                    } label: {
                        
                        Text("Xem Thêm".uppercased())
                            .fontWeight(.semibold)
                            .padding()
                            .withLoading(active: $viewModel.loadingUpdated)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("Persian Blue"))
                            .cornerRadius(15)
                        
                    }
                    .disabled(viewModel.loadingUpdated)
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

struct HomeUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            HomeView()
        }
    }
}
