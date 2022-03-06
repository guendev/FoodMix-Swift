//
//  Notification.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct Notification: Identifiable {
    
    let id: String
    // người gửi
    var from: User?
    var to: User?
    var group: String?
    var image: String?
    var content: String?
    var createdAt: Float?
    var readAt: Float?
    
}


