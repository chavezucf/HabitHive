//
//  CustomTabBar.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        return UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @Binding var showAddHabitView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            TabBarButton(imageName: "square", label: "Habits", selectedTab: $selectedTab)
            
            Spacer()
            
            Button(action: {
                showAddHabitView.toggle()
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(HHColors.White)
                    .padding(20)
                    .background(HHColors.Primary)
                    .clipShape(Circle())
            }
            .offset(y: -20)
            
            Spacer()
            
            TabBarButton(imageName: "list.dash", label: "List", selectedTab: $selectedTab)
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 20)
        .background(VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark)))
    }
}

struct TabBarButton: View {
    let imageName: String
    let label: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            selectedTab = label
        }) {
            VStack {
                Image(systemName: imageName)
                    .font(.title2)
                    .foregroundColor(selectedTab == label ? HHColors.Primary : HHColors.White)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(selectedTab == label ? HHColors.Primary : HHColors.White)
            }
        }
    }
}

#Preview {
    NavigationView {
        ZStack{
            BackgroundGradient()
            VStack{
                Spacer()
                CustomTabBar(selectedTab: .constant("Habits"), showAddHabitView: .constant(false))
            }
            .navigationTitle("Habits")
        }
    }
}
