//
//  HelloView.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text("Xin Chào")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
                                    
                Text("Bang Kotan")
                    .font(.custom(.customFont, size: 20))
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Circle()
                .fill(Color("Ultramarine Blue").opacity(0.5))
                .frame(width: 50, height: 50)
            
            
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
