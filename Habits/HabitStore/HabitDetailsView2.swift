//
//  HabitDetailsView2.swift
//  Habits
//
//  Created by Miguel Chavez on 7/20/23.
//

import SwiftUI

struct HabitDetailsView2: View {
    var body: some View {
        VStack {
            Image("habit_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Habit Name")
                .foregroundColor(HHColors.White)
            Text("Habit Short Description")
                .foregroundColor(HHColors.White)
            Button(action: {}) {
                Text("Track")
                    .foregroundColor(HHColors.White)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(HHColors.Tertiary.opacity(0.2))
        .cornerRadius(10)
    }
}

struct HabitCategoryView: View {
    var body: some View {
        VStack {
            Image("habit_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Habit Name")
                .foregroundColor(HHColors.White)
            Text("Habit Short Description")
                .foregroundColor(HHColors.White)
            Button(action: {}) {
                Text("Track")
                    .foregroundColor(HHColors.White)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(HHColors.Tertiary.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    HabitDetailsView2()
}
