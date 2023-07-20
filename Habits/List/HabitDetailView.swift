//
//  HabitDetailView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI
import SwiftData

struct HabitDetailView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.modelContext) private var modelContext
    var habit: SaveHabit
    var habitProgress: CGFloat
    init(habit: SaveHabit) {
        self.habit = habit
        self.habitProgress = 0.75
    }
    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(habitProgress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(HHColors.Black)
                    .rotationEffect(Angle(degrees: 270.0))
                    .overlay(content: {
                        VStack{
                            Text("\(Int(habitProgress * 30))/30")
                                .font(.title)
                                .foregroundColor(HHColors.Black)
                                .bold()
                            
                            Group {
                                Text("Days missed: \(habit.daysMissed)")
                                Text("Current streak: \(habit.currentStreak) days")
                                Text("Longest streak: \(habit.longestStreak) days")
                                Text("Ends on: \(format(date: habit.endDate))")
                            }
                            .font(.subheadline)
                            .foregroundColor(HHColors.Gray)
                        }
                    })
                    .padding(.top, 70)

                Spacer()
                Button(action: deleteHabit) {
                    Text("Delete Habit")
                }
                .padding()
                .background(.red)
                .foregroundColor(HHColors.White)
                .cornerRadius(10)
                .padding(.bottom)
                Spacer()
            }
            .padding()
            .foregroundColor(HHColors.White)
            .navigationBarTitle(habit.name, displayMode: .inline)
        }
    }
    
    private func deleteHabit() {
        self.presentation.wrappedValue.dismiss()
        modelContext.delete(habit)
    }

    func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}



//@MainActor
//#Preview {
//    HabitDetailView(habit: sampleData[0])
//}
