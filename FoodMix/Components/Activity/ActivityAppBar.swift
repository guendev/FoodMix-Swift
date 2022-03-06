//
//  ActivityAppBar.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct ActivityAppBar: View {
    var body: some View {
        HStack {
            
            Image(systemName: "text.alignleft")
                .resizable()
                .scaledToFit()
                .frame(width: 22)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text("Xếp Hạng")
                .font(.custom(.customFont, size: 20))
                .foregroundColor(.black.opacity(0.7))
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .rotationEffect(Angle.init(degrees: 90))
                .foregroundColor(.gray)
            
        }
        .padding(.vertical)
    }
}

struct ActivityAppBar_Previews: PreviewProvider {
    static var previews: some View {
        ActivityAppBar()
    }
}
