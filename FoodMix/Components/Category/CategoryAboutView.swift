//
//  CategoryAboutView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct CategoryAboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Thịt Kho")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black.opacity(0.8))
                .frame(maxWidth: getScreenBounds().width - 170, alignment: .leading)
            
            Text("I have a SwiftUI App which uses a public API to download cocktail data by name but I am not very familiar with SwiftUI and I cannot see a way of initialising my view model in my DetailsView file.")
                .foregroundColor(.gray)
                .lineSpacing(7)
            
        }
    }
}

struct CategoryAboutView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryAboutView()
    }
}
