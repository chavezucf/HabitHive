//
//  OnboardingView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI

struct OnboardingView: View {
    var imageName: String
    var headerText: String
    var descriptionText: String
    var buttonText: String
    var buttonAction: () -> Void
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                Text(headerText)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    .foregroundColor(HHColors.Black)
                Text(descriptionText)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(HHColors.Black)
                    .padding(.horizontal, 50)
                    .padding(20)
                Button(action: buttonAction) {
                    Text(buttonText)
                        .padding()
                        .background(HHColors.Primary)
                        .foregroundColor(HHColors.Black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    OnboardingView(imageName: "logo", headerText: "Welcome to HabitHive", descriptionText: "Your personal sidekick for creating and tracking habits.", buttonText: "Next") {
        //self.selectedTab += 1
    }
}
