//
//  Date.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import Foundation

extension Date {
    func subtractingDays(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }
    
    func addingDays(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
    }
}
