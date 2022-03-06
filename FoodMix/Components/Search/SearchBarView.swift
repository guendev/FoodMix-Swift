//
//  SearchView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI
import CoreData

struct SearchBarView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel: SearchViewModel
    
    @Environment(\.managedObjectContext) var viewContext
    
    @State var text: String?
    
    
    var body: some View {
        
        HStack {
            
            Button {
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Image(systemName: "arrow.left")
                    .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                
            }
            
            
                TextField("Tìm kiếm", text: $viewModel.keyword) { _ in
                    
                } onCommit: {
                    text = "submit"
                    saveHistory()
                }.font(.custom(.customFont, size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                .frame(height: 45)
                .padding(.leading, 25)
                .padding(.trailing, 50)
                .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 0.9391186773)))
                .cornerRadius(30)
                .accentColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                /**
                .overlay(
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                        .padding()
                    
                    ,alignment: .leading
                    
                )
                 */
                .overlay(
                    
                    Button {
                        
                        viewModel.keyword = ""
                        
                    } label: {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(Color(#colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1)))
                            .frame(width: 12, height: 12)
                            .padding()
                        
                    }
                    .scaleEffect(viewModel.keyword == "" ? 0 : 1)
                    .animation(.spring())
                    
                    ,alignment: .trailing
                    
                )
            
            
        }
        .padding(.horizontal, 25)
        
    }
    
    private func saveHistory() -> Void {
        
        if viewModel.keyword == "" {
            return
        }
        
        // kiểm tra lịch sử
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchHistory")
        
        fetchRequest.predicate = NSPredicate(format: "keyword == %@", viewModel.keyword.trimmingCharacters(in: .whitespacesAndNewlines))
        
        
        if (try? viewContext.fetch(fetchRequest).first) != nil { return }
                
        let record = SearchHistory(context: viewContext)
        record.createdAt = Int32(NSDate().timeIntervalSince1970)
        record.keyword = viewModel.keyword
        
        _ = try? viewContext.save()
        
        limitHistory()
        
    }
    
    private func limitHistory() {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchHistory")
        fetchRequest.sortDescriptors = [ NSSortDescriptor(keyPath: \SearchHistory.createdAt, ascending: false) ]
        
        let histories = try? viewContext.fetch(fetchRequest)
        
        if histories!.count < 4 { return }
        
        viewContext.delete(histories!.last as! NSManagedObject)
        
        try? viewContext.save()
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    
    let persistenceController = PersistenceController.shared
    
    static var previews: some View {
        SearchView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
