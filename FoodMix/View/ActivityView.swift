//
//  ActivityView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct ActivityView: View {
    
    @StateObject var viewModel: ActivityViewModel = ActivityViewModel()
    
    @State var getFirst: Bool = false
    
    @State var offset: CGFloat = .zero
        
    var body: some View {
        
        VStack(spacing: 0) {
            
            ActivityAppBar()
                .padding(.horizontal, 25)
            
            ZStack {
                
                if viewModel.authors.count >= 3 {
                    
                    // top 3
                    ActivityBigTop()
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
        .padding(.horizontal, 25)
        .background(Color(#colorLiteral(red: 0.9921568627, green: 0.937254902, blue: 0.9254901961, alpha: 1)).ignoresSafeArea())
        .overlay(
            
            CustomBottomSheet(offset: $offset, overlay: false, minHeight: getScreenBounds().height * 0.08, midHeight: getScreenBounds().height * 0.45, maxHeight: getScreenBounds().height * 0.85) {
                
                VStack(spacing: 15) {
                    
                    HStack {
                        
                        Text("Tác Giả Nổi Bật")
                            .font(.system(size: 22))
                            .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                        
                        Spacer()
                        
                        
                    }
                    .padding(.top, 10)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        if viewModel.authors.count > 3 {
                            
                            VStack(spacing: 20) {
                                
                                ForEach((4...(viewModel.authors.count)), id: \.self) { index in
                                    
                                    HStack(spacing: 15) {
                                        
                                        Text("\(index)")
                                        
                                        RecipeAvatar(avatar: viewModel.authors[index - 1].avatar)
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(60)
                                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 0)
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text(viewModel.authors[index-1].name)
                                                .font(.custom(.customFont, size: 18))
                                                .lineLimit(1)
                                            
                                            Text("@dnstylish")
                                                .font(.custom(.customFont, size: 14))
                                                .foregroundColor(.gray)
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        Text("120CT")
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 15)
                                            .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                                            .cornerRadius(10)
                                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 0)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            ,alignment: .bottom
            
        )
        .onAppear {
            
            if getFirst {
                return
            }
            getFirst = false
            viewModel.getAuthors()
            
        }
        .environmentObject(viewModel)
    }

}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
