//
//  DashboardView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct DashboardView: View {
    @State private var showingAddHabitView = false
    var habits: [Habit]
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(0..<habits.count) { i in
                            HabitRowView(habitName: habits[i].name, habitProgress: habits[i].progress, habitLength: habits[i].length)
                                .padding(5)
                                .cornerRadius(10)
                                .frame(height: 150)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Habits")
            }
        }
        .accentColor(HHColors.White)
    }
}


struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [HHColors.Primary, HHColors.Secondary, HHColors.Secondary, HHColors.LightGray]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}



#Preview {
    DashboardView(habits: tempHabits)
}
