//
//  ActivityViewModel.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

class ActivityViewModel: ObservableObject {
    
    @Published var authors: [User] = []
    
    func getAuthors() -> Void {
        authors.append(User(id: "", name: "", slug: ""))
    }
    
}
