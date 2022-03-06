//
//  Recipe.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct Recipe: Identifiable {
    let id: String
    var name: String
    var slug: String
    var avatar: String
    var content: String?
    var category: Category?
    var user: User?
    
    var ingredients: [Ingredient]?
    var stepper: [Stepper]?
    
    var time: String?
    var preparation: String?
    
    var countRating: Int?
    var totalRating: Int?
    var views: Int?
    
    var createdAt: Float?
}

struct Stepper {
    var id = UUID().uuidString
    let name: String
    let content: String
    let image: String
}


struct Ingredient {
    var id = UUID().uuidString
    let name: String
    let count: Int
    let unit: String
}
