//
//  NotificationViewModel.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    
    @Published var noties: [Notification] = []
    
    func getNotifies() -> Void {
        
        noties.append(
            
            Notification(
                id: "1",
                from: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                group: "",
                image: "",
                content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            )
            
        )
        
        noties.append(
            
            Notification(
                id: "2",
                from: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                group: "",
                image: "",
                content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            )
            
        )
        
        noties.append(
            
            Notification(
                id: "3",
                from: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                group: "",
                image: "",
                content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            )
            
        )
        
        noties.append(
            
            Notification(
                id: "4",
                from: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                group: "",
                image: "",
                content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            )
            
        )
        
        noties.append(
            
            Notification(
                id: "5",
                from: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                group: "",
                image: "",
                content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            )
            
        )
        
        noties.append(
            
            Notification(
                id: "6",
                from: User(id: "1", name: "Kim Ngân", slug: "", avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg"),
                group: "",
                image: "",
                content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            )
            
        )
        
    }
}
