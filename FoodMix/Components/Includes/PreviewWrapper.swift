//
//  PreviewWrapper.swift
//  FoodMix
//
//  Created by Yuan on 06/03/2022.
//

import SwiftUI

struct PreviewWrapper<Content: View>: View {
    
    @AppStorage("welcome") var welcome: Bool = true
    
    let persistenceController = PersistenceController.shared
    let content: Content
    
    @StateObject private var viewModel: AppViewModel = AppViewModel()
        
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            
            content
            
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .environmentObject(viewModel)
        .introspectNavigationController { nav in
            nav.navigationBar.isHidden = true
        }
    }
}
