//
//  AccountViewModel.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    
    // Auth Data
    @Published var auth: Bool = false
    @Published var currentUser: User?
    
    @Published var provinces: [Province] = [Province]()
    
    var provincesMap: [String] {
        get {
            return provinces.map { item in
                return item.name
            }
        }
    }
    
    
    func getProvinces() -> Void {
        
        if !provinces.isEmpty {
            return
        }
        
        guard let rawData = loadJson(forFilename: "provinces") else { return }
        
        for item in rawData {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: item.value) else { break }
            guard let province = try? JSONDecoder().decode(Province.self, from: jsonData) else { break }
            provinces.append(province)
           
        }
        
    }
    
}
