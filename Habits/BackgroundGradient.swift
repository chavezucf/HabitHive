//
//  BackgroundGradient.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI


struct BackgroundGradient: View {
    //Color(hex: "#FFC640")
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [HHColors.Primary , HHColors.Secondary, HHColors.Secondary]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundGradient()
}
