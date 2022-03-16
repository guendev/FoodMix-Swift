//
//  ReviewItemView.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

struct ReviewItemView: View {
    
    @State var review: Review
    
    @State var limit: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .top,spacing: 15) {
                
                NavigationLink {
                    
                    ProfileView(slug: review.user!.slug)
                    
                } label: {
                
                    RecipeAvatar(avatar: review.user?.avatar)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    
                }

                
                VStack(alignment: .leading, spacing: 3) {
                    
                    NavigationLink {
                        
                        ProfileView(slug: review.user!.slug)
                        
                    } label: {
                        
                        Text(review.user!.name)
                            .foregroundColor(Color("TextTitle"))
                            .font(.callout)
                            .lineLimit(1)
                        
                    }

                    
                    StarRating(rating: 4.5, size: 13)
                    
                }
                
            }
            
            Text(review.content)
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(limit ? 3 : nil)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color("TextContent"))
                .onTapGesture {
                    
                    
                    withAnimation {
                        limit.toggle()
                    }
                    
                }
            
            Text(verbatim: .formatTime(review.createdAt))
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(3)
                .opacity(0.8)
            
        }
        .padding()
        .background(Color("WhiteBackground"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
        
    }
}
