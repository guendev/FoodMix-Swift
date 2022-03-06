//
//  HomeView.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        
        VStack {
            
            HelloView()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Khám phá ngay!")
                        .font(.custom(.customFont, size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                        .padding(.top, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HomeSearch()
                    
                    HomeCategories()
                    
                    HomeIngredient()
                    
                    HomeUpdatedView()
                    
                }
                
            }
            
        }
        .environmentObject(viewModel)
        .padding(.horizontal, 25)
        .background(Color("Background").ignoresSafeArea())

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
