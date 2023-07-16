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
    var habitProgress: Double

    var body: some View {
        HStack {
            Text(habitName)
                .foregroundColor(HHColors.Black)
            Spacer()
            if habitDone {
                Image(systemName: "checkmark")
                    .foregroundColor(HHColors.Accent)
                    .transition(.scale)
            }
        }
        .padding()
        .background(HHColors.Primary.opacity(isLongPress ? 0.5 : 1))
        .cornerRadius(10)
        .scaleEffect(isLongPress ? 1.1 : 1.0)
        .animation(.easeInOut, value: isLongPress)
        .gesture(
            LongPressGesture(minimumDuration: 1.0)
                .updating($isLongPress) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { _ in
                    withAnimation {
                        self.habitDone.toggle()
                    }
                }
        )
    }
}



#Preview {
    HabitRowView(habitName: "Code", habitProgress: 0.30)
}
