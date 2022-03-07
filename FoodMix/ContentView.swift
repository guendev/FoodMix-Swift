//
//  ContentView.swift
//  Shared
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI
import Introspect

struct ContentView: View {
    
    // welcome -> mở app lần đầu
    @AppStorage("welcome") var welcome: Bool = true
    
    @StateObject private var viewModel: AppViewModel = AppViewModel()
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            MainView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
