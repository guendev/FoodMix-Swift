//
//  ProvinceFormView.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

struct ProvinceFormView: View {
    
    var provinces: [String] = ["Hà Nội", "Phú Yên"]
    @State var currentProvince: String = "Hà Nội"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            PrimaryInputLabel(label: "Quê Quán")
            
            Picker("Quê Quán Của Bạn", selection: $currentProvince) {
                ForEach(provinces, id: \.self) { province in
                    Text("\(province)")
                }
            }
            .accentColor(Color("InputText"))
            .withAlignment(alignment: .leading)
            .primaryButton()
    
            
        }
        
    }
    
}

struct ProvinceFormView_Previews: PreviewProvider {
    static var previews: some View {
        ProvinceFormView()
    }
}
