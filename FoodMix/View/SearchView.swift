//
//  SearchView.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
        
    var body: some View {
        
        VStack(spacing: 25) {
            
            SearchBarView()
            
            ScrollView {
                
                VStack {
                    
                    SearchHistoryView()
                    
                }
                
            }
            .padding(.horizontal, 25)
            
        }
        .environmentObject(viewModel)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
