//
//  NavigationExtention.swift
//  FoodMix
//
//  Created by Yuan on 07/03/2022.
//

import SwiftUI

extension View {
    
    func withAuth(_ auth: Binding<Bool>) -> some View {
        return self.modifier(WithAuth(auth: auth))
    }
    
}

struct WithAuth: ViewModifier {
    
    @Binding var auth: Bool
    
    @State private var isActive: Bool = false
    
    func body(content: Content) -> some View {
        
        Button {
            if !auth {
                isActive = true
            }
        } label: {
            content.disabled(true)
        }
        .background(
            Group {
                
                if !auth {
                    NavigationLink(isActive: $isActive) {
                        WelcomeView()
                    } label: {
                        EmptyView()
                    }
                    .hidden()
                }
                
            }
        )

        
    }
}
