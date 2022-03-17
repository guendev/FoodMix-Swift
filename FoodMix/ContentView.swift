//
//  ContentView.swift
//  Shared
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: AppViewModel = AppViewModel()
        
    var body: some View {
        
        MainView()
        .environmentObject(viewModel)
        .environment(\.authKey, viewModel.auth)
        .environment(\.currentUserKey, viewModel.user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            .environment(\.colorScheme, .dark)
    }
}
