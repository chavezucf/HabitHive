//
//  DailyReminderSetupView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct DailyReminderSetupView: View {
    @State private var reminderTime: Date = Date()

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Reminder Time", selection: $reminderTime, displayedComponents: .hourAndMinute)
                    .padding()
                Button("Save Reminder") {
                    // Save the reminder
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                Spacer()
            }
            .navigationTitle("Set Daily Reminder")
        }
    }
}

#Preview {
    DailyReminderSetupView()
}
