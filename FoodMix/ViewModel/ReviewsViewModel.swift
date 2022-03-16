//
//  ReviewsViewModel.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

class ReviewsViewModel: ObservableObject {
    
    @Published var recipe: Recipe?
    
    @Published var reviews: [Review] = [Review]()
    @Published var loading: Bool = false
    @Published var empty: Bool = false
    @Published var page: Int = 0
    
    func getReviews(limit: Int = 10) -> Void {
        if recipe == nil || loading { return }
        
        loading = true
        
        let filter = SortOption(sort: "createdAt", page: "\(page)", limit: "\(limit)")
        Network.shared.apollo.fetch(query: GetReviewsQuery(id: recipe!.slug, filter: filter)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let rawData = graphQLResult.data?.getReviews else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let review = try? JSONDecoder().decode(Review.self, from: jsonData) else { continue }
                    
                    self.reviews.append(review)
                }
                
                self.loading = false
                self.empty = rawData.isEmpty
                
                // sub recipe
            case .failure(_):
                break
            }
            
        }
        
    }
    
}
