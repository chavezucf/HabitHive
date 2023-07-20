//
//  AddHabitView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

class AddHabitViewModel: ObservableObject {
    @Published var showingSheet: Bool = false
}

struct AddHabitView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: AddHabitViewModel
    @State private var habitName: String = ""
    @State private var length: Int = 30
    let lengthChoices = [30, 60, 90]
    @State private var reminderTime: String = "Morning"
    let reminderTimes = [("Morning", "sun.max.fill"), ("Noon", "sun.max"), ("Evening", "moon.fill")]

    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                
                VStack {
                    Text("Customize Your Habit Preferences")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    TextField("Habit Name", text: $habitName)
                        .font(.title)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(HHColors.Tertiary))
              
                        .foregroundColor(.black)
                }
                
                
                VStack {
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
                    
                    .frame(height: 50)
                    .padding(.top, 5)
                }
                Spacer()
                
                VStack {
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
                    .frame(height: 50)
                    .padding(.top, 15)
                }
                Spacer()

                Button(action: addHabit) {
                    Text("Save Habit")
                }
                .padding()
                .background(HHColors.Primary)
                .foregroundColor(HHColors.Black)
                .cornerRadius(10)
                .padding(.bottom)
                
                Spacer()
            }
            .padding()
            .foregroundColor(HHColors.Primary)
            .background(HHColors.Black)
        }
    }
    
    private func addHabit() {
        let newHabit = SaveHabit(name: habitName, startDate: Date(), endDate: Date(), progress: 0, length: length, isCurrent: true)
        modelContext.insert(newHabit)
        viewModel.showingSheet.toggle()
    }
}



