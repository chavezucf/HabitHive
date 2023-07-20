//
//  Habit.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import Foundation
import SwiftData
struct Habit: Identifiable {
    var id = UUID()
    var name: String
    var startDate: Date
    var endDate: Date
    var progress: Int
    var length: Int
    var isCurrent: Bool
    var daysMissed: Int = 2
    var currentStreak: Int = 2
    var longestStreak: Int = 12
    
    init(name: String, startDate: Date, endDate: Date, progress: Int, length: Int, isCurrent: Bool) {
        self.id = UUID()
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.progress = progress
        self.length = length
        self.isCurrent = isCurrent
        self.daysMissed = 2
        self.currentStreak = 2
        self.longestStreak = 12
    }
}

@Model
final class SaveHabit {
    @Attribute(.unique) var id = UUID()
    var name: String
    var startDate: Date
    var endDate: Date
    var progress: Int
    var length: Int
    var isCurrent: Bool
    var daysMissed: Int = 2
    var currentStreak: Int = 2
    var longestStreak: Int = 12
    
    init(name: String, startDate: Date, endDate: Date, progress: Int, length: Int, isCurrent: Bool) {
        self.id = UUID()
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.progress = progress
        self.length = length
        self.isCurrent = isCurrent
        self.daysMissed = 2
        self.currentStreak = 2
        self.longestStreak = 12
    }
}


let sampleData = [
    SaveHabit(name: "Meditate", startDate: Date(), endDate: Date(), progress: 2, length: 30, isCurrent: true),
    SaveHabit(name: "Exercise", startDate: Date(), endDate: Date(), progress: 12, length: 30, isCurrent: true),
    SaveHabit(name: "Drink Water", startDate: Date(), endDate: Date(), progress: 30, length: 30, isCurrent: false)
]
 


let tempHabits = [
    Habit(name: "Meditate", startDate: Date(), endDate: Date(), progress: 2, length: 30, isCurrent: true),
    Habit(name: "Exercise", startDate: Date(), endDate: Date(), progress: 12, length: 30, isCurrent: true),
    Habit(name: "Drink Water", startDate: Date(), endDate: Date(), progress: 30, length: 30, isCurrent: false)
]
 
