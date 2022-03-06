//
//  AppViewModel.swift
//  FoodMix
//
//  Created by Yuan on 05/03/2022.
//

import SwiftUI
import Apollo

class AppViewModel: ObservableObject {
    
    private var subNotify: Cancellable?
    
    init() {
        
        if UserDefaults.standard.string(forKey: "jsonwebtoken") != nil {
            subNotifyAction()
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
