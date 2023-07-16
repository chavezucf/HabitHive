//
//  Habit.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import Foundation

struct Habit: Identifiable {
    var id = UUID()
    var name: String
    var startDate: Date
    var endDate: Date?
    var progress: Int
    var length: Int
    var isCurrent: Bool
}
let tempHabits = [
//        Habit(name: "Meditate", startDate: currentDate.subtractingDays(2), endDate: currentDate.addingDays(28), progress: 2, length: 30, isCurrent: true),
//        Habit(name: "Exercise", startDate: currentDate.subtractingDays(12), endDate: currentDate.addingDays(18), progress: 12, length: 30, isCurrent: true),
//        Habit(name: "Drink Water", startDate: currentDate.subtractingDays(40), endDate: currentDate.subtractingDays(10), progress: 30, length: 30, isCurrent: false)
//
        Habit(name: "Meditate", startDate: Date(), endDate: Date(), progress: 2, length: 30, isCurrent: true),
        Habit(name: "Exercise", startDate: Date(), endDate: Date(), progress: 12, length: 30, isCurrent: true),
        Habit(name: "Drink Water", startDate: Date(), endDate: Date(), progress: 30, length: 30, isCurrent: false)
]
