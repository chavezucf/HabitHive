//
//  ContentView2.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab = "Habits"
    @Environment(\.modelContext) private var modelContext
    @Query private var saveHabits: [SaveHabit]
    @StateObject private var addHabitViewModel = AddHabitViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if selectedTab == "Habits" {
                    DashboardView()
                } else if selectedTab == "List" {
                    HabitStoreView()
                }
            }
            CustomTabBar(selectedTab: $selectedTab, showAddHabitView: $addHabitViewModel.showingSheet)
        }
        .sheet(isPresented: $addHabitViewModel.showingSheet) {
            AddHabitView(viewModel: addHabitViewModel)
        }
        
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    ContentView()
}
