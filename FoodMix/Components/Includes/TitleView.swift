//
//  TitleView.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct TitleView<Content: View>: View {
    
    var title: String
    
    let content: Content
        
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        HStack {
            
            Text(title)
                .font(.custom(.customFont, size: 20))
                .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1333333333, blue: 0.3098039216, alpha: 1)))
            
            Spacer()
            
            content
            
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Phân Nhóm") {
            
        }
            .padding()
    }
}
