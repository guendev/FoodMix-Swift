//
//  InputExtention.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

extension View {
    
    func primaryInput(icons: Edge.Set.ArrayLiteralElement = [], label: String? = nil) -> some View {
        self.modifier(PrimaryInput(icons: icons, label: label))
    }
    
}

struct PrimaryInput: ViewModifier {
    
    var icons: Edge.Set.ArrayLiteralElement = []
    var label: String?
    
    func body(content: Content) -> some View {
        return content
            .autocapitalization(.none)
            .foregroundColor(Color("InputText"))
            .frame(height: 50)
            .padding(icons, 25)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background(Color("InputBackground"))
            .cornerRadius(15)
            .padding(.top, label != nil ? 30 : 0)
            .overlay(
                
                Group {
                    
                    if label != nil {
                        
                        PrimaryInputLabel(label: label!)
                        
                    }
                    
                }
                
                ,alignment: .topLeading
            )
    }
}

struct PrimaryInputLabel: View {
    
    var label: String
    
    var body: some View {
        
        Text(label)
            .font(.subheadline)
            .foregroundColor(Color("InputText"))
        
    }
    
}
