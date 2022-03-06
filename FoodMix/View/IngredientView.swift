//
//  IngredientView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct IngredientView: View {
    
    @State private var show: Bool = false
    
    var ingredient: IngredientItem
    
    var colors: [Color] = [Color("Byzantine"), Color("Dodger Blue"), Color("Flickr Pink"), Color("Persian Blue"), Color("Purple")]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack(spacing: 25) {
                    
                    Text(ingredient.name)
                        .font(.system(size: 30))
                        .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                        .offset(x: 0, y: show ? 0 : 30)
                        .opacity(show ? 1 : 0)
                        .animation(.spring(), value: show)
                    
                    Spacer()
                    
                    Button {
                        
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    } label: {
                        
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray.opacity(0.4))
                        
                    }
                    .scaleEffect(show ? 1 : 0)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.2), value: show)
                    
                }
                
                Text(ingredient.content)
                    .lineSpacing(6)
                    .lineLimit(2)
                    .foregroundColor(.gray)
                    .offset(x: 0, y: show ? 0 : 30)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.2), value: show)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    
                    Text("Đặc Tính")
                        .font(.custom(.customFont, size: 22))
                        .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                        .offset(x: 0, y: show ? 0 : 30)
                        .opacity(show ? 1 : 0)
                        .animation(.spring().delay(0.4), value: show)
                    
                    ForEach((0...ingredient.properties.count - 1), id: \.self) { index in
                        
                        HStack {
                            
                            Circle()
                                .fill(getColor())
                                .frame(width: 30, height: 30)
                                .overlay(
                                    
                                    Text("\(index + 1)")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                )
                                .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                            
                            Text(ingredient.properties[index])
                            
                        }
                        .padding(.top)
                        .offset(x: 0, y: show ? 0 : 30)
                        .opacity(show ? 1 : 0)
                        .animation(.spring().delay(getDelay(index: index)), value: show)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                RecipeAvatar(avatar: ingredient.image)
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .scaleEffect(show ? 1 : 0.5)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.6), value: show)
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .padding(.top)
            
            TitleView(title: "Công Thức Sử Dụng") {
                Text("Xem thêm")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.top, 20)
            .offset(x: 0, y: show ? 0 : 30)
            .opacity(show ? 1 : 0)
            .animation(.spring().delay(getDelay(index: ingredient.properties.count)), value: show)
            
        }
        .padding([.horizontal, .top], 25)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                show = true
            }
            
        }
    }
    
    func getColor() -> Color {
        return colors.randomElement()!
    }
    
    func getDelay(index: Int) -> Double {
        return 0.4 +  Double(index + 1) * 0.2
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: IngredientItem(
                        id: "3",
                        name: "Rau Mùi",
                        image: "https://i.imgur.com/GvqcfUs.png",
                        content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                        properties: ["Rau Mùi Vị", "Dễ Sử Dụng", "Giá Rẻ"]
        ))
    }
}
