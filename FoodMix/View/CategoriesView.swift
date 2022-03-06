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
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            HStack(spacing: 25) {
                
                Text("Phân Loại")
                    .font(.system(size: 30))
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                
                Spacer()
                
                Button {
                    
                    withAnimation {
                        // presentationMode.wrappedValue.dismiss()
                    }
                    
                } label: {
                    
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.gray.opacity(0.4))
                    
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(alignment: .leading, spacing: 40) {
                    
                    ForEach((0...categories.count - 1), id: \.self) { index in
                        
                        HStack(alignment: .top) {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("\(categories[index].name)")
                                    .foregroundColor(.black.opacity(0.8))
                                    .font(.title2)
                                
                                Text("Để có một chế độ ăn hợp lý bạn đừng quên 5 nhóm thực phẩm cần thiết phải có trong các bữa ăn hàng ngày.")
                                    .lineSpacing(6)
                                    .foregroundColor(.gray)
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("12")
                                .padding(8)
                                .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)))
                                .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                                .cornerRadius(10)
                            
                        }
                        .padding(.leading, 60)
                        .overlay(
                            
                            RecipeAvatar(avatar: categories[index].avatar)
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .scaleEffect(show ? 1 : 0.5)
                                .animation(.spring().delay(getDelay(index: index) + 0.1), value: show)
                            
                            ,alignment: .topLeading
                            
                        )
                        .overlay(
                            
                            Rectangle()
                                .fill(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)).opacity(0.1))
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
                
            }
            
        }
        .padding([.horizontal, .top], 25)
        .onAppear {
            
            DispatchQueue.main.async {
                show = true
            }
            
        }
        
        
    }
    
    func getDelay(index: Int) -> Double {
        return 0.4 +  Double(index + 1) * 0.2
    }
}

struct CategoriesView_Previews: PreviewProvider {

    
    static var previews: some View {
        CategoriesView(categories: categories)
    }
}

fileprivate let categories: [Category] = [
    Category(id: "1", name: "Gà Quay", slug: "ga-quay", avatar: "https://i.imgur.com/sJapZxD.png", content: "", icon: ""),
    Category(id: "2", name: "Lẩu Gà", slug: "ga-quay", avatar: "https://i.imgur.com/sJapZxD.png", content: "", icon: ""),
    Category(id: "3", name: "Bún Phở", slug: "ga-quay", avatar: "https://i.imgur.com/sJapZxD.png", content: "", icon: ""),
    Category(id: "4", name: "Kem Lạnh", slug: "ga-quay", avatar: "https://i.imgur.com/sJapZxD.png", content: "", icon: ""),
    Category(id: "5", name: "Cơm Chó", slug: "ga-quay", avatar: "https://i.imgur.com/sJapZxD.png", content: "", icon: "")
]
