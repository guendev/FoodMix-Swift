//
//  Welcome.swift
//  FoodMix
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI
import Introspect

struct WelcomeView: View {
    
    @StateObject var viewModel: WelcomeViewModel = WelcomeViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var app: AppViewModel
    
    @State var rotation: Double = .zero
    
    var body: some View {
        
        OffsetPageTabView(offset: $viewModel.offset) {
            
            WelcomeAvatar()
        }
        .background(
            
            VStack {
                
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.white)
                    .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                    .scaleEffect(2)
                    .rotationEffect(.init(degrees: 25))
                    .rotationEffect(.init(degrees: rotation))
                    .offset(x: -20,y: -getScreenBounds().width / 2)
                
            }
                .frame(maxWidth: getScreenBounds().width)
            
            ,alignment: .top
            
        )
        .background(
            
            boardingScreens[viewModel.currentIndex].color
                .ignoresSafeArea()
        )
        .overlay(
            
            WelcomeButtons()
            
            ,alignment: .bottom
        
        )
        .onChange(of: viewModel.offset) { value in
            
            DispatchQueue.main.async {
                
                let process = viewModel.offset / getScreenBounds().width
                
                viewModel.currentIndex = Int(process)
                rotation = Double(process) * 180
                
            }
            
        }
        .environmentObject(viewModel)
        .onAppear {
            if app.auth {
                presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            WelcomeView()
        }
    }
}
