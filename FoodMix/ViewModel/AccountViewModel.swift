//
//  AccountViewModel.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI
import PhotosUI


class AccountViewModel: ObservableObject {
    
    @Published var currentUser: User?
    
    @Published var provinces: [Province] = [Province]()
    
    @Published var loadingAvatar: Bool = false
    
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
    
    func pickedAvatar(_ results: [PHPickerResult]) -> Void {
                
        guard let image = results.first?.itemProvider else { return }
        
        self.loadingAvatar = true
        
        if image.canLoadObject(ofClass: UIImage.self) {
            
            image.loadObject(ofClass: UIImage.self) { [weak self] img, error in
                
                guard let self = self else { return }
                
                if let typeCastedImage = img as? UIImage {
                    
                    FoodMixNetworkManager.shared.uploadSingle(endpoint: "avatar", image: typeCastedImage) { [weak self] result in
                        
                        guard let self = self else { return }
                        
                        self.currentUser?.avatar = result.data as? String
                        
                        self.loadingAvatar = false
                        
                        Toastify.show("Tải Lên Thành Công", image: "bell")
                                                
                    }
                    
                }
                                
            }
            
        }
        
        
    }
    
}
