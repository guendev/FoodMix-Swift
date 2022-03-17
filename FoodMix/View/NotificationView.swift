//
//  NotificationView.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI
import Introspect

struct NotificationView: View {
    
    @Environment(\.authKey) var auth
    
    var body: some View {
        
        ZStack {
            
            if auth {
                
                NotificationContent()
                
            } else {
                
                VStack(spacing: 20) {
                    
                    EmptyContent()
                    
                    PrimaryButtonView(title: "Đăng Nhập", active: .constant(false)) {
                        
                    }
                    .frame(maxWidth: 250)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Background").ignoresSafeArea())
                
            }
            
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environment(\.colorScheme, .dark)
    }
}
