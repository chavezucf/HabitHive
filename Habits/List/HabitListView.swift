//
//  HabitListView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI
import SwiftData

struct HabitListView: View {
    @Query private var habits: [SaveHabit]

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                List {
                    Section(header: Text("Current Habits")) {
                        ForEach(habits.filter { $0.isCurrent }) { habit in
                            NavigationLink(destination: HabitDetailView(habit: habit)) {
                                HabitCell(habit: habit)
                            }
                            .listRowBackground(HHColors.Tertiary)
                        }
                    }

                    Section(header: Text("Previous Habits")) {
                        ForEach(habits.filter { !$0.isCurrent }) { habit in
                            NavigationLink(destination: HabitDetailView(habit: habit)) {
                                HabitCell(habit: habit)
                            }
                            .listRowBackground(HHColors.Tertiary)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("All Habits")
                .scrollContentBackground(.hidden)
            }
        }
        .accentColor(HHColors.White)
    }
}

struct HabitCell: View {
    var habit: SaveHabit

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
    HabitListView()
        .modelContainer(for: SaveHabit.self, inMemory: true)
}
