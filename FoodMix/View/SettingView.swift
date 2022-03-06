//
//  SettingView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            
            SettingAppBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 35) {
                    
                    UserCenter()
                        .padding(.horizontal, 25)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Cài Đặt Chung")
                            .font(.custom(.customFont, size: 18))
                            .foregroundColor(Color("Text"))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 25)
                        
                        SettingItemView(title: "Thông Báo") {
                            Toggle("", isOn: .constant(true))
                        }
                        
                        SettingItemView(title: "Giao Diện Tối") {
                            Toggle("", isOn: .constant(true))
                        }
    
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Cài Đặt Chung")
                            .font(.custom(.customFont, size: 18))
                            .foregroundColor(Color("Text"))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 25)
                        
                        SettingItemView(title: "Thông Báo") {
                            Toggle("", isOn: .constant(true))
                        }
                        
                        SettingItemView(title: "Giao Diện Tối") {
                            Toggle("", isOn: .constant(true))
                        }
    
                        
                    }
                    
                }
                .padding(.top, 25)
                
            }
            
        }
        .background(Color("Background").ignoresSafeArea())
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

fileprivate struct SettingItemView<Content: View>: View {
    
    var title: String
    
    let content: Content
        
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.custom(.customFont, size: 16))
                .foregroundColor(.black.opacity(0.8))
            
            Spacer()
            
            content
            
        }
        .padding(.horizontal, 25)
        .padding(.vertical)
        .background(Color.white)
        
    }
    
}
