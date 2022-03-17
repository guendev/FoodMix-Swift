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
        
        NavigationView {
            
            VStack() {
                ActivityAppBar()
                    .padding(.horizontal, 25)
                
                ActivityBigTop()
                
                Spacer()
                
                
            }
            .overlay(
                
                ActivityListAuthor()
                    .frame(width: getScreenBounds().width)
                    .background(Color("WhiteBackground"))
                    .clipShape(CustomSheetShape())
                    .offset(y: 30)
                
                ,alignment: .bottom
                
            )
            .background(Color("Background").ignoresSafeArea())
            .environmentObject(viewModel)
            .introspectNavigationController { navi in
                navi.navigationBar.isHidden = true
            }
            
        }
    }

}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                
                ActivityView()
                
            }
            PreviewWrapper {
                
                ActivityView()
                
            }
            .environment(\.colorScheme,  .dark)
        }
    }
}
