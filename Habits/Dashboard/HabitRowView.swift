//
//  HabitRowView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct HabitRowView: View {
    @GestureState private var isLongPress = false
    @State private var habitDone = false
    var habitName: String
    var habitProgress: Int
    var habitLength: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(habitDone ? HHColors.Primary : HHColors.Gray)
                .frame(maxWidth: .infinity)
                .scaleEffect(isLongPress ? 1.05 : 1.0)
                .animation(.easeInOut, value: isLongPress)
                .animation(.easeInOut, value: habitDone)
            
            VStack {
                Text(habitName)
                    .font(.title)
                    .foregroundColor(habitDone ? HHColors.Black : HHColors.White)
                
                Text("\(habitProgress)/\(habitLength) days")
                    .font(.subheadline)
                    .foregroundColor(habitDone ? HHColors.Black : HHColors.White)
            }
        }
        .gesture(
            LongPressGesture(minimumDuration: 0.5)
                .updating($isLongPress) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { _ in
                    withAnimation {
                        self.habitDone.toggle()
                        HapticFeedback.shared.complexSuccess()
                    }
                }
        )
    }
}






#Preview {
    HabitRowView(habitName: "Code", habitProgress: 20, habitLength: 30)
        .frame(width: 200, height: 200)
}
