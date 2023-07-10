//
//  Item.swift
//  Habits
//
//  Created by Miguel Chavez on 7/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var name: String
    
    init(timestamp: Date, name: String) {
        self.timestamp = timestamp
        self.name = name
    }
}
