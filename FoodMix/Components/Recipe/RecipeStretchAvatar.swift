//
//  RecipeStretchAvatar.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeStretchAvatar: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment: .bottom) {
                
                if viewModel.recipe != nil {
                    
                    Color.clear
                        .overlay(
                            RecipeAvatar(avatar: viewModel.recipe!.avatar)
                                .scaledToFill()
                        )
                        .clipShape(RecipeClip())
                }
                
            }
            .frame(width: geo.frame(in: .global).width)
            .frame(height: 350 + viewModel.stretchHeight)
            .offset(y: -viewModel.stretchHeight)
            .onChange(of: geo.frame(in: .global), perform: { value in
                scaleHeight(geo.frame(in: .global))
            })
            
        }
        .frame(height: 350)
        .overlay(
            
            Button {
                
            } label: {
                
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color("Flickr Pink"))
                    .clipShape(Circle())
                    .shadow(color: Color("Flickr Pink"), radius: 2, x: 0, y: 0)
                
            }
            .offset(x: -30, y: -30)
            
            ,alignment: .bottomTrailing
            
        )
    }
    
    func scaleHeight(_ rect: CGRect) -> Void {
        viewModel.stretchHeight = rect.minY >= 0 ? rect.minY : 0
        viewModel.offset = rect.minY
    }
}

struct RecipeStretchAvatar_Previews: PreviewProvider {
    static var previews: some View {
        RecipeStretchAvatar()
    }
}

struct RecipeClip: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = CGFloat(50)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
       
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - radius * 2))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX + radius, y: rect.maxY - radius), control: CGPoint(x: rect.minX, y: rect.maxY - radius))
        
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        
        // path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
    
}
