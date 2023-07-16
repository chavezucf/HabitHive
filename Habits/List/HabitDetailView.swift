//
//  HabitDetailView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI
struct HabitDetailView: View {
    let habitName: String
    @State private var progress: Double = 0.5
    @State private var daysMissed: Int = 2
    @State private var currentStreak: Int = 5
    @State private var longestStreak: Int = 7
    @State private var endDate: Date = Calendar.current.date(byAdding: .day, value: 30, to: Date())!

    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(HHColors.Black)
                    .rotationEffect(Angle(degrees: 270.0))
                    .overlay(content: {
                        VStack{
                            Text("\(Int(progress * 30))/30")
                                .font(.title)
                                .foregroundColor(HHColors.Black)
                                .bold()
                            
                            Group {
                                Text("Days missed: \(daysMissed)")
                                Text("Current streak: \(currentStreak) days")
                                Text("Longest streak: \(longestStreak) days")
                                Text("Ends on: \(format(date: endDate))")
                            }
                            .font(.subheadline)
                            .foregroundColor(HHColors.Gray)
                        }
                    })
                    .padding(.top, 70)

                Spacer()
            }
            .padding()
            .foregroundColor(HHColors.White)
            .navigationTitle(habitName)
            .navigationBarItems(trailing: Button("Delete") {
                // Delete the habit
            })
        }
    }

    func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}



#Preview {
    HabitDetailView(habitName: "DO IT")
}
