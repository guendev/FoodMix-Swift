//
//  RecipeStepperLine.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct RecipeStepperLine: View {
    
    @Binding var current: Int
    var index: Int
    var count: Int
    
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                
                Button {
                                               
                    withAnimation {
                            current = index
                    }
                                               
                                               
                } label: {
                                               
                    if current <= index {
                        
                        Text("\(index + 1)")
                            .font(.custom(.customFont, size: 15))
                            .foregroundColor(current == index ? Color("Primary") : .gray)
                            .frame(width: 25, height: 25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(current == index ? Color("Primary") : .gray, lineWidth: 2)
                            )
                        
                    } else {
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12)
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .background(Color("Success"))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                    }
                                               
                }
                
                if index < (count - 1) || index == (count - 1) {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill( current >= index ? Color("Success") : Color.gray.opacity(0.3))
                        .frame(width: 1.5)
                        .frame(height: stepperHeight(height: geo.frame(in: .global).height))
                    
                }
                
            }
            
        }
    }
    
    func stepperHeight(height: CGFloat) -> CGFloat {
        
        if index < count - 1 {
            return height - 5
        }
        
        return height - 20
        
    }
}
