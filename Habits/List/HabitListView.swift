//
//  HabitListView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI

struct HabitListView: View {
    var habits: [Habit]

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                List {
                    Section(header: Text("Current Habits")) {
                        ForEach(habits.filter { $0.isCurrent }) { habit in
                            NavigationLink(destination: HabitDetailView(habitName: habit.name)) {
                                HabitCell(habit: habit)
                            }
                        }
                    }

                    Section(header: Text("Previous Habits")) {
                        ForEach(habits.filter { !$0.isCurrent }) { habit in
                            NavigationLink(destination: HabitDetailView(habitName: habit.name)) {
                                HabitCell(habit: habit)
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Habits")
            }
        }
    }
}

struct HabitCell: View {
    var habit: Habit

    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.name)
                .font(.headline)
            Text("\(habit.progress)/\(habit.length) days")
                .font(.subheadline)
        }
    }
}


#Preview {
    HabitListView(habits: tempHabits)
}
