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
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
