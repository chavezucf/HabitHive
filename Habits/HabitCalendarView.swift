//
//  HabitCalendarView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct HabitCalendarView: View {
    // Placeholder habit data
    let habitName: String

    var body: some View {
        VStack {
            Text("Habit Calendar for \(habitName)")
                // TODO: Replace with a real calendar view
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Habit Calendar")
    }
}


#Preview {
    HabitCalendarView(habitName: "DO IT")
}
