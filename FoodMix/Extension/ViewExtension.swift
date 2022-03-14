//
//  ViewExtension.swift
//  FoodMix
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI

extension View {
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    
    func safeInsets() -> UIEdgeInsets? {
        return UIApplication.shared.windows.first?.safeAreaInsets
    }
}


/// Error Form
extension View {
    func withErrorForm(msg: Binding<String>) -> some View {
        return self.modifier(ErrorFormMessage(msg: msg))
    }
}

struct ErrorFormMessage: ViewModifier {
    
    @Binding var msg: String
    
    func body(content: Content) -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            
            content
            
            if !msg.isEmpty {
                
                Text(msg)
                    .font(.caption)
                    .foregroundColor(Color("Rose"))
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                msg = ""
                            }
                        }
                        
                    }
                
            }
            
        }
    }
}

/// Loading button

extension View {
    func withLoading(active: Binding<Bool>) -> some View {
        return self.modifier(WithLoading(active: active))
    }
}

struct WithLoading: ViewModifier {
    
    @Binding<Bool> var active: Bool
    
    @State private var animating: Bool = false
    
    var duration: Double = 0.5
    
    func body(content: Content) -> some View {
        return content
            .opacity(active ? 0 : 1)
            .clipped()
            .overlay(
                Group {
                    
                    if active {
                        
                        HStack(spacing: 10) {
                            
                            ForEach(1...3, id: \.self) { index in
                                
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .opacity(0.7)
                                    .scaleEffect(animating ? 1 : 0.3)
                                    .animation(.linear(duration: duration).repeatForever(autoreverses: true).delay(duration * Double(index) / Double(3) * 2), value: animating)
                                
                            }
                            
                            
                        }
                        .onAppear {
                            
                            animating.toggle()
                            
                        }
                        .onDisappear {
                            
                            animating.toggle()
                            
                        }
                        
                    }
                    
                }
            )
    }
}
