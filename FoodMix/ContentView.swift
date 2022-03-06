//
//  ContentView.swift
//  Shared
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("welcome") var welcome: Bool = true
    
    @StateObject private var viewModel: AppViewModel = AppViewModel()
    
    var body: some View {
        ZStack {
            if welcome {
                WelcomeView()
            } else {
                // SearchView()
                MainView()
                // AuthView()
            }
            
        }
        .transition(.slide)
        .animation(.easeInOut)
        .onAppear {
             // welcome = true
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
