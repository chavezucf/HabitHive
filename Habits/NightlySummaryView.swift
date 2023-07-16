//
//  NightlySummaryView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct NightlySummaryView: View {
    // Placeholder habit and progress data
    let habits = [("Meditate", true), ("Drink water", false), ("Exercise", true)]

    var body: some View {
        VStack {
            Text("Nightly Summary")
                .font(.largeTitle)
                .padding()
            List {
                ForEach(habits, id: \.0) { habit, isComplete in
                    HStack {
                        Text(habit)
                        Spacer()
                        if isComplete {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Button("Complete Now") {
                                // Mark the habit as complete
                            }
                            .padding(5)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Nightly Summary")
    }
}

#Preview {
    NightlySummaryView()
}
