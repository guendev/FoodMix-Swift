//
//  CategoriesView.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct CategoriesView: View {
    
    var categories: [Category]
    
    @State var show: Bool = false
    @Namespace var animation
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                    
                }
                
                Text("Phân Nhóm")
                    .font(.custom(.customFont, size: 22))
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .rotationEffect(Angle.init(degrees: 90))
                
            }
            .foregroundColor(.black.opacity(0.7))
            .padding(.vertical)
            .padding(.horizontal, 25)
            .background(Color.white)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(alignment: .leading, spacing: 40) {
                    
                    ForEach((0...categories.count - 1), id: \.self) { index in

                        NavigationLink {
                            CategoryView(category: categories[index])
                        } label: {
                            CategoryItemView(item: categories[index], index: index)
                        }


                        
                    }
                    
                }
                
            }
            .padding(.horizontal, 25)
            
        }
        .onAppear {
            
            DispatchQueue.main.async {
                show = true
            }
            
        }
        
        
    }
    
    func getDelay(index: Int) -> Double {
        return 0.4 +  Double(index + 1) * 0.2
    }
    
    @ViewBuilder
    private func CategoryItemView(item: Category, index: Int) -> some View {
        
        HStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("\(item.name)")
                    .foregroundColor(.black.opacity(0.8))
                    .font(.title2)
                
                Text("Để có một chế độ ăn hợp lý bạn đừng quên 5 nhóm thực phẩm cần thiết phải có trong các bữa ăn hàng ngày.")
                    .multilineTextAlignment(.leading)
                    .lineSpacing(6)
                    .foregroundColor(.gray)
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("12")
                .padding(8)
                .background(Color("InputBackground"))
                .foregroundColor(Color("InputText"))
                .cornerRadius(10)
            
        }
        .padding(.leading, 60)
        .overlay(
            
            RecipeAvatar(avatar: item.icon)
                .scaledToFit()
                .frame(width: 50, height: 50)
                .scaleEffect(show ? 1 : 0.5)
                .animation(.spring().delay(getDelay(index: index) + 0.1), value: show)
            
            ,alignment: .topLeading
            
        )
        .overlay(
            
            Rectangle()
                .fill(Color("InputBackground"))
                .frame(height: 2)
                .frame(maxWidth: getScreenBounds().width - 20 * 2 - 60 - 5)
                .offset(y: 20)
            
            ,alignment: .bottomTrailing
            
        )
        .opacity(show ? 1 : 0)
        .offset(y: show ? 0 : 50)
        .animation(.spring().delay(getDelay(index: index)), value: show)
        
    }
}

struct CategoriesView_Previews: PreviewProvider {

    
    static var previews: some View {
        
        PreviewWrapper {
            
            HomeView()
            
        }
        
    }
}

