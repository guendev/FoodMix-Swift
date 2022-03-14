//
//  RecipeStepperView.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct RecipeStepperView: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    @State var current: Int = .zero
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
                
            RecipeFirstStepper()
            
            VStack(spacing: 40) {
                
                if viewModel.recipe != nil {
                                   
                    ForEach((0...(viewModel.recipe!.stepper!.count - 1)),  id: \.self) { index in
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            
                            Button {
                                
                                withAnimation {
                                    current = index
                                }
                                
                            } label: {
                                
                                HStack {
                                    
                                    Text(getStepper(index).name)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .foregroundColor(current > index ?  .black.opacity(0.7) : current == index ? Color("Primary") : .gray)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    if current >= index {
                                        
                                        Text(current == index ? "Đang Làm" : "Đã Làm")
                                            .font(.caption)
                                            .padding(.horizontal, 15)
                                            .padding(.vertical, 7)
                                            .background( current != index ? Color("Success") : Color("Warning"))
                                            .foregroundColor(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            if current == index {
                                
                                
                                Text("Tailwind includes an expertly-crafted default color palette out-of-the-box that is a great starting point if you don’t have your own specific branding in mind.")
                                    .font(.custom(.customFont, size: 14))
                                    .lineSpacing(6)
                                    .foregroundColor(Color("TextContent"))
                                    .fixedSize(horizontal: false, vertical: true)
                                
                            }
                            
                        }
                        .padding(.leading, 45)
                        .overlay(
                        
                            RecipeStepperLine(current: $current, index: index, count: viewModel.recipe!.stepper!.count)
                            
                            ,alignment: .leading
                            
                        )
                        
                    }
                                   
                }
                
            }
            
        }
        
    }
    
    func getStepper(_ index: Int) -> Stepper {
        return viewModel.recipe!.stepper![index]
    }
    
}

struct RecipeStepperView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(recipe: Recipe(id: "6211e6447d3b441181c395da", name: "Lê Thị Kim Ngân", slug: "le-thi-kim-ngan", avatar: "https://cdn.tgdd.vn/2021/03/CookProduct/bunmocchangio-1200x676.jpg"))
            
        }
    }
}
