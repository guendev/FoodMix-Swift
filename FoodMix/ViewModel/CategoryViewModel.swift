//
//  CategoryViewModel.swift
//  FoodMix
//
//  Created by Yuan on 03/03/2022.
//

import SwiftUI

class CategoryViewModel: ObservableObject {
    
    @Published var category: Category?
    @Published var offset: CGFloat = .zero
    
    @Published var recipes: [Recipe] = []
    
    
    
    func getRecipes() -> Void {
        
        
        recipes.append(Recipe(id: "1", name: "Lợn Xào Sả Ớt", slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg"))
        recipes.append(Recipe(id: "2", name: "Bún Măng Gà", slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg"))
        recipes.append(Recipe(id: "3", name: "Cơm Thầy Ông Nội", slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg"))
        recipes.append(Recipe(id: "4", name: "Gà Dương Vật", slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg"))
        recipes.append(Recipe(id: "5", name: "Nước Mía", slug: "", avatar: "https://img.traveltriangle.com/blog/wp-content/uploads/2018/12/cover-for-street-food-in-sydney.jpg"))
        
    }
    
}
