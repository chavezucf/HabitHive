//
//  ContentView2.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Habits"
    @State private var showAddHabitView = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if selectedTab == "Habits" {
                    DashboardView(habits: tempHabits)
                } else if selectedTab == "List" {
                    HabitListView(habits: tempHabits)
                }
            }
            CustomTabBar(selectedTab: $selectedTab, showAddHabitView: $showAddHabitView)
        }
        .sheet(isPresented: $showAddHabitView) {
            AddHabitView()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    ContentView()
}
