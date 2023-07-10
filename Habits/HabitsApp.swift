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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
