//
//  ActivityView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct ActivityView: View {
    
    @StateObject var viewModel: ActivityViewModel = ActivityViewModel()
    
    @State var getFirst: Bool = false
            
    var body: some View {
        
        VStack() {
            ActivityAppBar()
                .padding(.horizontal, 25)
            
            ActivityBigTop()
            
            Spacer()
            
            
        }
        .overlay(
            
            ActivityListAuthor()
                .frame(width: getScreenBounds().width)
                .background(Color.white)
                .clipShape(CustomSheetShape())
            
            ,alignment: .bottom
            
        )
        .background(Color("Background").ignoresSafeArea())
        .environmentObject(viewModel)
    }

}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            ActivityView()
            
        }
    }
}
