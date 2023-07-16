//
//  HabitsApp.swift
//  Habits
//
//  Created by Miguel Chavez on 7/10/23.
//

import SwiftUI
import SwiftData

@main
struct HabitsApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                ContentView()
                    .background(.green)
            } else {
                DashboardView()
            }
        }
        .modelContainer(for: Item.self)
    }
}
