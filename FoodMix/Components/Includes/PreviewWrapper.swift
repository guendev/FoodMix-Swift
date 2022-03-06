//
//  PreviewWrapper.swift
//  FoodMix
//
//  Created by Yuan on 06/03/2022.
//

import SwiftUI
import Firebase

struct PreviewWrapper<Content: View>: View {
    
    let persistenceController = PersistenceController.shared
    let content: Content
        
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView {
            
            content
            
        }
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .introspectNavigationController { navi in
            navi.navigationBar.isHidden = true
        }
    }
}
