//
//  AppearanceConfigurator.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI
import UIKit

struct AppearanceConfigurator {
    static func configureNavigationBar() {
        let white = UIColor(Color(HHColors.White))
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        appearance.backgroundColor = UIColor(Color.orange.opacity(0.2))
        appearance.largeTitleTextAttributes = [.foregroundColor: white]
        appearance.titleTextAttributes = [.foregroundColor: white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
