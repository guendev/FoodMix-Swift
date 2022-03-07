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
            print("🌈 Đăng nhập: \(auth)")
        }
        
    }
    
    @Published var auth: Bool = false
    
    private var subNotify: Cancellable?
    
    init() {
        
        
        if UserDefaults.standard.string(forKey: "jsonwebtoken") != nil {
            queryUser {
                self.subNotifyAction()
            }
        }
        
    }
    
    func queryUser(success: @escaping () -> Void) -> Void {
        
        Network.shared.apollo.fetch(query: MeQuery()) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.me else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let user = try? JSONDecoder().decode(User.self, from: jsonData) else { break }
                
                self.user = user
                                
                success()
                
                
            case .failure(_):
                break
            
            }
            
        }
        
    }
    
    func subNotifyAction() -> Void {
        
        print("❌ DEBUG: Sub Notify start....")
        subNotify =  Network.shared.apollo.subscribe(subscription: SubNotifySubscription()) { result in
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.subNotify else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let notify = try? JSONDecoder().decode(Notify.self, from: jsonData) else { break }
                
                Toastify.show(notify.msg, image: "bell", background: notify.success() ? Color("Primary") : Color("Flickr Pink"))
                
                
            case .failure(_):
                break
            
            }
            
        }
        
    }
    
}
