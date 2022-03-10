//
//  ProfileViewModel.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    
    @Published var ready: Bool = false
    
    @Published var loadingContent: Bool = false
    @Published var recipes: [Recipe] = [Recipe]()
    @Published var reviews: [Review] = [Review]()
    
    @Published var offset: CGFloat = .zero
    
    @Published var current: FilterItem = FilterItem(name: "Món Ăn", value: "recipes")
    
    func getProfile(slug: String) {
        Network.shared.apollo.fetch(query: GetProfileQuery(id: slug)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getProfile else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let profile = try? JSONDecoder().decode(User.self, from: jsonData) else { break }
                
                self.user = profile
                self.ready = true
                
            case .failure(_):
                break
            }
            
        }
    }
    
}
