//
//  MainViewModel.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var currentTab: MainTab = .Home
    
}

enum MainTab: String, CaseIterable {
    case Home = "Home"
    case Activity = "Activity"
    case Notification = "Notification"
    case Profile = "Profile"
}
