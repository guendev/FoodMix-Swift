//
//  RecipeReviews.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

struct RecipeReviews: View {
    
    @State var reviews: [Review] = Array.init(
        repeating: Review(
            id: "6214877f810728861c0b2329",
            user: User(
                id: "6211bc6c51c56521e3c8a693",
                name: "Nguyên",
                email: "nstylish9@gmail.com",
                slug: "nguyen",
                avatar: "https://i.imgur.com/pqGLgGr.jpg"
            ),
            content: "SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible. With SwiftUI, you can bring even better experiences to all users, on any Apple device, using just one set of tools and APIs.",
            totalRating: 10,
            createdAt: 1645512575615
        ),
        count: 3
    )
        
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            
            TitleView(title: "Đánh Giá") {
                
                Text("Xem thêm")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
                
            }
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    ForEach(0...2, id: \.self) { index in
                        
                        ReviewItemView(review: reviews[index])
                        
                    }
                    
                }
                
            }
            
            HStack {
                
                Image(systemName: "paperplane")
                    .renderingMode(.template)
                
                Text("Thêm đánh giá")
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .renderingMode(.template)
                
            }
            .padding()
            .foregroundColor(Color("TextContent"))
            .background(Color("Background2"))
            .cornerRadius(25)
            
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
