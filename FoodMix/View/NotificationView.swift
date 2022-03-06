//
//  NotificationView.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct NotificationView: View {
    
    @StateObject var viewModel: NotificationViewModel = NotificationViewModel()
    
    var body: some View {
        VStack {
            
            AppBar(title: "Thông Tin"){
                
            }
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: -5)
            .foregroundColor(.black.opacity(0.8))
            
            HomeSearch()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 25) {
                    
                    ForEach(viewModel.noties, id: \.id) { item in
                        
                        NotificationItem(notify: item)
                        
                    }
                    
                }
                .padding(.top, 30)
                
            }

            
        }
        .padding(.horizontal, 25)
        .background(Color("Background").ignoresSafeArea())
        .onAppear {
            
            viewModel.getNotifies()
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
