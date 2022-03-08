//
//  CategoryAboutView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct CategoryAboutView: View {
    
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\(category.name)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black.opacity(0.8))
                .frame(maxWidth: getScreenBounds().width - 170, alignment: .leading)
            
            Text(category.content ?? "")
                .foregroundColor(.gray)
                .lineSpacing(7)
            
        }
    }
}
