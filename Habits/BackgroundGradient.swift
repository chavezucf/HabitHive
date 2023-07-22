//
//  BackgroundGradient.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI


struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [HHColors.LightGray , HHColors.BackgroundL, HHColors.BackgroundL]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct TestBackgroundGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [HHColors.Primary , HHColors.Secondary, HHColors.Primary]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundGradient()
}
