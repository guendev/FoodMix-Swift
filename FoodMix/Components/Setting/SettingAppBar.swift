//
//  UserCenterView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct SettingAppBar: View {
    var body: some View {
        HStack {
            
            Text("Cài Đặt")
                .font(.custom(.customFont, size: 22))
                .foregroundColor(.black.opacity(0.7))
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .rotationEffect(Angle.init(degrees: 90))
                .foregroundColor(.black.opacity(0.7))
            
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: -5)
    }
}

struct UserCenterView_Previews: PreviewProvider {
    static var previews: some View {
        SettingAppBar()
    }
}
