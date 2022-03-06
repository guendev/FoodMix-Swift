//
//  RecipeAbout.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeAbout: View {
    
    @State var limitLine: Bool = false
    
    @State var string: CGFloat = .zero
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Giới Thiệu") {}
            
            Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
                .lineSpacing(6)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
                // .background(
                    
                 //   GeometryReader { geo -> AnyView in
                 //       return AnyView(
                 //           Color.clear
                 //               .onAppear {
                 //                   if geo.frame(in: .global).height > 200 {
                 //
                 //                       limitLine = true
                 //
                 //                   }
                 //               }
                 //       )
                 //   }
                    
                // )
                .frame(maxHeight: limitLine ? 200: nil)
                .clipped()
                // .overlay(
                    
                //    Button {
                        
                //        withAnimation {
                //            limitLine = false
                //        }
                        
                //    } label: {
                        
                //        Text("Xem Thêm")
                        
                //    }
                //    .font(.subheadline)
                //    .padding(.horizontal, 20)
                //    .padding(.vertical, 10)
                //    .frame(maxWidth: .infinity)
                //    .foregroundColor(.black.opacity(0.7))
                //    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)).opacity(0.1), Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773))]), startPoint: .top, endPoint: .bottom))
                 //   .opacity(limitLine ? 1 : 0)
                 //   .disabled(!limitLine)
                    
                    
                 //   ,alignment: .bottom
                //)
            
        }
        
    }
}

struct RecipeAbout_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
