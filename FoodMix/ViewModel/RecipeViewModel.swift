//
//  RecipeViewMode.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    
    @Published var slug: String?
    
    @Published var recipe: Recipe?
    
    @Published var offset: CGFloat = .zero
    
    @Published var stretchHeight: CGFloat = .zero
    
    
    func getRecipe(_ slug: String) -> Void {
        
        recipe = Recipe(
            id: "1",
            name: "Lợn Xào Sả Ớt",
            slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg",
            user: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
            ingredients: [
                Ingredient(name: "Hành Lá", count: 200, unit: "gram"),
                Ingredient(name: "Thịt Bò", count: 120, unit: "lit"),
                Ingredient(name: "Hành Lá", count: 200, unit: "gram"),
                Ingredient(name: "Thịt Bò", count: 120, unit: "lit"),
                Ingredient(name: "Hành Lá", count: 200, unit: "gram"),
                Ingredient(name: "Thịt Bò", count: 120, unit: "lit"),
                Ingredient(name: "Hành Lá", count: 200, unit: "gram"),
                Ingredient(name: "Thịt Bò", count: 120, unit: "lit")
            ], stepper: [
                Stepper(name: "Chuẩn Bị",content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", image: ""),
                Stepper(name: "Luộc Thịt", content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", image: ""),
                Stepper(name: "Hầm Xương", content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", image: ""),
                Stepper(name: "Trang Trí", content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", image: "")
            ]
        )
        
    }
    
    func setOffset(_ rect: CGRect) -> CGFloat {
        offset = rect.minY
        return .zero
    }
    
}
