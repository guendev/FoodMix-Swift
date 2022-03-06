//
//  AppViewModel.swift
//  FoodMix
//
//  Created by Yuan on 05/03/2022.
//

import SwiftUI
import Apollo

class AppViewModel: ObservableObject {
    
    @Published var user: User? {
        
        didSet {
            
            auth = user != nil
            
        }
        
    }
    
    @Published var auth: Bool = false
    
    private var subNotify: Cancellable?
    
    init() {
        
        if UserDefaults.standard.string(forKey: "jsonwebtoken") != nil {
            queryUser()
        }
        
    }
    
    func queryUser() -> Void {
        
        Network.shared.apollo.fetch(query: MeQuery()) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                if let value = graphQLResult.data?.me {
                    
                    self.user = User(
                        id: value.id!,
                        name: value.name,
                        email: value.email,
                        slug: value.slug,
                        role: value.role,
                        avatar: value.avatar
                    )
                    
                }
                
                if self.auth {
                    
                    self.subNotifyAction()
                    
                }
                
                
            case .failure(_):
                break
            
            }
            
        }
        
    }
    
    func subNotifyAction() -> Void {
        
        print("❌ DEBUG: Sub Notify start....")
        subNotify =  Network.shared.apollo.subscribe(subscription: SubNotifySubscription()) { [weak self] result in
            
            guard self != nil else { return }
            
            print("❌ DEBUG: \(result)")
            
        }
        
    }
    
    
}
