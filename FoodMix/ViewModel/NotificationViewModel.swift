//
//  NotificationViewModel.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    
    @Published var noties: [Notification] = []
    
    @Published var loading: Bool = false
    @Published var empty: Bool = false
    @Published var page: Int = 0
    
    func getNotifies() -> Void {
        if loading { return }
        loading.toggle()
        
        let filter = SortOption(sort: "createdAt", page: "\(page)", limit: "10")
        Network.shared.apollo.fetch(query: GetNotificationsQuery(filter: filter)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let graphQLResult):
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getNotifications else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let notify = try? JSONDecoder().decode(Notification.self, from: jsonData) else { continue }
                    
                    self.noties.append(notify)
                }
                
                self.empty = rawData.isEmpty
                self.page += 1
                self.loading = false
                
            case .failure(_):
                break
                
            }
            
        }
    }
}
