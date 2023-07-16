//
//  DashboardView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct DashboardView: View {
    @State private var showingAddHabitView = false
    let habits = ["Meditate", "Drink Water", "Exercise"]
    let habitProgress = [0.3, 0.5, 0.7]

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(0..<habits.count) { i in
                            NavigationLink(destination: HabitDetailView(habitName: habits[i])) {
                                HabitRowView(habitName: habits[i], habitProgress: Double(Float(habitProgress[i])))
                                    .padding()
                                    .background(HHColors.Black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("My Habits")
                .navigationBarItems(trailing:
                    Button(action: {
                        showingAddHabitView = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(HHColors.Black)
                    }
                )
                .sheet(isPresented: $showingAddHabitView) {
                    AddHabitView()
                }
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
    DashboardView()
}
