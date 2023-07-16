//
//  ContentView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            OnboardingView(imageName: "logo", headerText: "Welcome to HabitHive", descriptionText: "Your personal sidekick for creating and tracking habits.", buttonText: "Next") {
                self.selectedTab += 1
            }
                .tag(0)
            OnboardingView(imageName: "logo", headerText: "Build Better Habits", descriptionText: "Create and customize your habit journey.", buttonText: "Next") {
                self.selectedTab += 1
            }
                .tag(1)
            OnboardingView(imageName: "logo", headerText: "Track Your Progress", descriptionText: "Keep track of your habits with an intuitive calendar view.", buttonText: "Get Started") {
                self.isOnboarding = false
            }
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear {
          setupAppearance()
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(HHColors.Primary)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct OnboardingView: View {
    var imageName: String
    var headerText: String
    var descriptionText: String
    var buttonText: String
    var buttonAction: () -> Void
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .padding(40)
            Text(headerText)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50)
                .foregroundColor(HHColors.Primary)
            Text(descriptionText)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .padding(20)
            Button(action: buttonAction) {
                Text(buttonText)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
    }
}


#Preview {
    ContentView()
}
