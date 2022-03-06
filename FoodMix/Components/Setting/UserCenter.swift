//
//  UserCenter.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct UserCenter: View {
    var body: some View {
        HStack(spacing: 16) {
            
            Circle()
                .fill(Color("Ultramarine Blue").opacity(0.3))
                .frame(width: 56, height: 56)
            
            VStack(alignment:  .leading, spacing: 8) {
                
                Text("Nguyên Trần")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.7))
                    .lineLimit(1)
                
                Text("dnstylish@gmail.com")
                    .font(.custom(.customFont, size: 16))
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                
                Text("Sửa")
                    .font(.custom(.customFont, size: 15))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                    .cornerRadius(20)
                
            }
            
        }
    }
}

struct UserCenter_Previews: PreviewProvider {
    static var previews: some View {
        UserCenter()
    }
}
