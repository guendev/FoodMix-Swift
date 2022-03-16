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
            
            Spacer()
            
            Text("Xếp Hạng")
                .font(.title2)
                .foregroundColor(Color("TextTitle"))
            
            Spacer()
            
        }
        .padding(.vertical)
    }
}

struct ActivityAppBar_Previews: PreviewProvider {
    static var previews: some View {
        ActivityAppBar()
    }
}
