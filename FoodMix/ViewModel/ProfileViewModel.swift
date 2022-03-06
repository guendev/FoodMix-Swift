//
//  ProfileViewModel.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    
    @Published var offset: CGFloat = .zero
    
    @Published var currentTab: ProfileTab = .Recipes
    
}

enum ProfileTab: String, CaseIterable {
    case Recipes = "Recipes"
    case Reviews = "Reviews"
}
