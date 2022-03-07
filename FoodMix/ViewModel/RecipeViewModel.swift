//
//  RecipeViewMode.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
                
    @Published var recipe: Recipe? {
        
        didSet {
            ready = loading || recipe != nil
        }
        
    }
    
    @Published var loading: Bool = false {
        
        didSet {
            ready = loading || recipe != nil
        }
        
    }
    
    @Published var ready: Bool = false
        
    @Published var offset: CGFloat = .zero
    
    @Published var stretchHeight: CGFloat = .zero
    
    
    func getRecipe(_ slug: String) -> Void {
        
        if loading {
            return
        }
        loading = true
        
        Network.shared.apollo.fetch(query: GetRecipeQuery(id: slug)) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            
            case .success(let graphQLResult):
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getRecipe else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { break }
                
                self.recipe = recipe
                self.loading = false
                
                // sub recipe
                
                // getbookmark
                self.getBookmark()
                
                
            case .failure(_):
                break
            }
            
        }
    }
    
    func getBookmark() -> Void { }
    
    func bookmarkAction() -> Void {
        
    }
    
    func setOffset(_ rect: CGRect) -> CGFloat {
        offset = rect.minY
        return .zero
    }
    
}
