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
                            .font(.callout)
                            .foregroundColor(Color("TextTitle"))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 25)
                        
                        SettingItemView(title: "Thư Viện") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
                        
                        SettingItemView(title: "Lịch Sử") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
    
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Cài Đặt Chung")
                            .font(.callout)
                            .foregroundColor(Color("TextTitle"))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 25)
                        
                        SettingColorSchema()
                        
                        SettingItemView(title: "Trung Tâm Chính Sách") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
                        
                        SettingItemView(title: "Số Phiên Bản") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
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
        PreviewWrapper {
            
            SettingView()
            
        }
    }
}
