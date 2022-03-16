//
//  RecipeReviews.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

struct RecipeReviews: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    @StateObject var reviewViewModel: ReviewsViewModel = ReviewsViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            
            TitleView(title: "Đánh Giá") {
                
                Text("Xem thêm")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
                
            }
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    Group {
                        
                        ForEach(reviewViewModel.reviews, id: \.id) { review in
                            
                            ReviewItemView(review: review)
                            
                        }
                        
                    }
                    
                    if reviewViewModel.loading || viewModel.recipe == nil {
                                            
                        ReviewItemView.previews(2)
                        
                    }
                    
                    if reviewViewModel.empty {
                        
                        EmptyContent()
                            .withAlignment(alignment: .center)
                        
                    }
                    
                }
                
            }
            
            HStack {
                
                Image(systemName: "paperplane")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 14, height: 14)
                
                Text("Thêm đánh giá")
                    .font(.caption)
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 14, height: 14)
                
            }
            .padding()
            .foregroundColor(Color("TextContent"))
            .background(Color("Background2"))
            .cornerRadius(25)
            
        }
        .onReceive(viewModel.$recipe) { value in
            
            if value != nil  {
                reviewViewModel.recipe = value
                reviewViewModel.getReviews(limit: 3)
            }
            
        }
        
    }
    
}

struct RecipeReviews_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            PreviewWrapper {
                
                RecipeView(slug: "le-thi-kim-ngan")
                
            }
            PreviewWrapper {
                
                RecipeView(slug: "le-thi-kim-ngan")
                
            }
            .environment(\.colorScheme, .dark)
        }
        
    }
}
