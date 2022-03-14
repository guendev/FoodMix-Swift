//
//  ProfileView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct ProfileView: View {
    
    var slug: String
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    @State var getFirst: Bool = false
    
    let filters: [FilterItem] = [
        FilterItem(name: "Món Ăn", value: "recipes"),
        FilterItem(name: "Đánh Giá", value: "reviews")
    ]
    
    var body: some View {
        ScrollView {
            
            ProfileStretchView()
            
            VStack(spacing: 25) {
                
                ProfileAboutView()
                
                TitleView(title: "Hoạt Động") {
                    
                    TabFilterView<FilterItem>(
                        filters: filters,
                        current: $viewModel.current,
                        title: { item in
                            return item.name
                        },
                        isCurrent: { item, current in
                            return item.value == current.value
                        }
                    )
                        .disabled(!viewModel.ready || viewModel.loadingContent)
                    
                }
                
            }
            .padding(.horizontal, 25)
            
            
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            
            AppBar(title: "Kim Ngân", back: true, animation: viewModel.offset < -150) {
                
            }
            .padding(.horizontal, 25)
            .background(
                Color("Primary")
                    .opacity(viewModel.offset < -150 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
            )
            .foregroundColor(.white)
            
            ,alignment: .top
            
        )
        .onAppear {
            
            if getFirst { return }
            getFirst = true
            viewModel.getProfile(slug: slug)
            
        }
        .background(Color("Background").ignoresSafeArea())
        .environmentObject(viewModel)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            ProfileView(slug: "igyuguyg")
            
        }
        
    }
}
