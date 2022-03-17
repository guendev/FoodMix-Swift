//
//  NotificationContent.swift
//  FoodMix
//
//  Created by Yuan on 17/03/2022.
//

import SwiftUI

struct NotificationContent: View {
    
    @StateObject var viewModel: NotificationViewModel = NotificationViewModel()
    

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                AppBar(title: "Thông Báo") {
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 25) {
                        ForEach(viewModel.noties, id: \.id) { item in
                            
                            NotificationItem(notify: item)
                            
                        }
                        
                        if viewModel.loading {
                            NotificationItem.previews()
                        }
                        
                        if viewModel.empty {
                            
                            EmptyContent()
                            
                        } else {
                            
                            PrimaryButtonView(title: "Xem Thêm", active: $viewModel.loading) {
                                viewModel.getNotifies()
                            }
                            
                        }
                    }
                    .padding(.top, 25)
                    
                }
                
            }
            .padding(.horizontal, 25)
            .background(Color("Background").ignoresSafeArea())
            .initView {
                viewModel.getNotifies()
            }
            .introspectNavigationController { navi in
                navi.navigationBar.isHidden = true
            }
            
        }
        
    }
    
}

struct NotificationContent_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
