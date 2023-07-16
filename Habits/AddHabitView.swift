//
//  AddHabitView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct AddHabitView: View {
    @State private var habitName: String = ""
    @State private var length: Int = 30
    let lengthChoices = [30, 60, 90]
    @State private var reminderTime: String = "Morning"
    let reminderTimes = [("Morning", "sun.max.fill"), ("Noon", "sun.max"), ("Evening", "moon.fill")]

    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                Text("Customize your habit preferences")
                    .font(.largeTitle)
                    .padding()

                TextField("Habit Name", text: $habitName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Text("Choose Length (Days)")
                    .font(.title2)
                    .padding(.top)

                HStack {
                    ForEach(lengthChoices, id: \.self) { choice in
                        SelectableButton(label: "\(choice)", isSelected: choice == length, action: {
                            length = choice
                        })
                    }
                }
                .padding(.bottom)

                Text("Select Reminder Time")
                    .font(.title2)
                    .padding(.top)

                HStack {
                    ForEach(reminderTimes, id: \.0) { time, icon in
                        SelectableButton(label: time, icon: icon, isSelected: time == reminderTime, action: {
                            reminderTime = time
                        })
                    }
                }

                Spacer()

                Button("Save Habit") {
                    // Save the habit
                }
                .padding()
                .background(HHColors.Black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom)
            }
            .padding()
            .foregroundColor(HHColors.Black)
            .background(HHColors.Primary)
        }
    }
}

struct SelectableButton: View {
    var label: String
    var icon: String? = nil
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(isSelected ? HHColors.White : HHColors.Black)
                }
                Text(label)
                    .foregroundColor(isSelected ? HHColors.White : HHColors.Black)
                Spacer()
            }
            .padding()
            .background(isSelected ? HHColors.Black : HHColors.Secondary)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}




#Preview {
    AddHabitView()
}
