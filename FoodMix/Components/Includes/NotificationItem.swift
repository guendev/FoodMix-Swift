//
//  NotificationView.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct NotificationItem: View {
    
    @State var notify: Notification
    
    @State var limit: Bool = true
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            RecipeAvatar(avatar: notify.from?.avatar)
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.03), radius: 10, x: 0.0, y: 0.0)
                .overlay(
                    Image("Edit")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .padding(6)
                        .background(Color("Primary"))
                        .cornerRadius(20)
                        .offset(x: 5, y: -3)
                        .shadow(color: Color("Primary"), radius: 10, x: 0.0, y: 0.0)
                    
                    ,alignment: .topTrailing
                )
            
            Button {
                
                withAnimation {
                    limit = false
                }
                
            } label: {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        
                        Text("\(notify.from!.name)")
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextTitle"))
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if notify.readAt == nil {
                            
                            Text("1m ago")
                                .font(.caption)
                                .foregroundColor(Color("TextContent"))
                            
                        } else {
                            
                            Text("Đã đọc")
                                .font(.caption)
                                .foregroundColor(Color("TextContent"))
                        }
                        
                        
                    }
                    
                    Text("\(notify.content!)")
                        .foregroundColor(Color("TextContent"))
                        .font(.subheadline)
                        .lineSpacing(5)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(limit ? 2 : nil)
                        .foregroundColor( notify.readAt == nil ? .gray : .black.opacity(0.7))
                    
                }
                
            }
            .buttonStyle(PlainButtonStyle())
            
        }
    }
}

struct NotificationItem_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
