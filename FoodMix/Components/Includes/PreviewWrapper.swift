//
//  PreviewWrapper.swift
//  FoodMix
//
//  Created by Yuan on 06/03/2022.
//

import SwiftUI

struct PreviewWrapper<Content: View>: View {
    
    // welcome -> mở app lần đầu
    @AppStorage("welcome") var welcome: Bool = true
    
    @StateObject private var viewModel: AppViewModel = AppViewModel()
    
    @State private var isActive: Bool = false
        
    let persistenceController = PersistenceController.shared
    let content: Content
            
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content
                .background(
                    
                    Group {
                        // view ẩn
                        NavigationLink(isActive: $isActive) {
                            WelcomeView()
                        } label: {
                            EmptyView()
                        }

                        
                    }
                    .hidden()
                    
                )
                .onAppear {
                    
                    // welcome = true
                    
                    if welcome {
                        welcome = false
                        isActive = true
                    }
                    
                }
        }
        .environmentObject(viewModel)
        .introspectNavigationController { nav in
            nav.navigationBar.isHidden = true
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
