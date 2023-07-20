//
//  DashboardView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query private var habits: [SaveHabit]
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(habits.filter { $0.isCurrent })  { habit in
                            HabitRowView(habitName: habit.name, habitProgress: habit.progress, habitLength: habit.length)
                                .padding(5)
                                .cornerRadius(10)
                                .frame(height: 150)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Current Habits")
            }
        }
    }
}


//#Preview {
//    DashboardView(habits: tempHabits)
//}
