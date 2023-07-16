//
//  ContentView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct OnboardingContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State private var selectedTab = 0
    var body: some View {
        ZStack {
            BackgroundGradient()
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
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(HHColors.Primary)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}


#Preview {
    OnboardingContentView()
}
