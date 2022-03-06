//
//  SearchViewModel.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI
import CoreData

class SearchViewModel: ObservableObject {
    
    @Published var keyword: String = ""
    
    @Environment(\.managedObjectContext) var viewContext
    
    func saveHistory() -> Void {
        if (keyword == "") {
            return
        }
        let record = SearchHistory(context: viewContext)
        record.createdAt = 45423
        record.keyword = keyword
        
        _ = try? viewContext.save()
    }
    
    func removeHistories() -> Void {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchHistory")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        _ = try? viewContext.execute(batchDeleteRequest)
        
    }
    
    
}
