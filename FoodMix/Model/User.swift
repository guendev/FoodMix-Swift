//
//  User.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import Foundation

struct User: Identifiable {
    let id: String
    var name: String
    var email: String?
    let slug: String
    var role: String = "user"
    var avatar: String?
    var banner: String?
    var province: String?
    var about: String?
    var countRecipe: Int?
    var countRating: Int?
    var totalRating: Int?
    
    var createdAt: Float?
}
