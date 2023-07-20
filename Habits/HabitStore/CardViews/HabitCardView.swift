//
//  HabitCardView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/20/23.
//

import SwiftUI

struct HabitCardView_Old: View {
    @State private var isTracked = false
    var habitName: String
    var habitShortDescription: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isTracked ? HHColors.Primary : HHColors.Gray)
                .shadow(radius: 10) // Add shadow to card
                
            VStack(alignment: .leading) {
                asyncImageLoader(url: URL(string: "https://picsum.photos/400/200")!)
                    .aspectRatio(contentMode: .fit)
                
                Text(habitName)
                    .font(.title2) // Adjust font size
                    .foregroundColor(isTracked ? HHColors.Black : HHColors.White)
                    .padding(.vertical) // Add some vertical padding
                
                Text(habitShortDescription)
                    .font(.subheadline)
                    .foregroundColor(isTracked ? HHColors.Black : HHColors.White)
                
                Spacer() // Push the button to bottom
                Button(action: {
                    withAnimation {
                        self.isTracked.toggle()
                    }
                }) {
                    Text("Track")
                        .fontWeight(.semibold)
                        .foregroundColor(isTracked ? HHColors.Black : HHColors.White)
                        .padding()
                        .frame(maxWidth: .infinity) // Make button full width
                        .background(isTracked ? Color.white.opacity(0.2) : Color.black.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct HabitCardView: View {
    @State private var isTracked = false
    var habitName: String
    var habitShortDescription: String

    var body: some View {
        ZStack {
            asyncImageLoader(url: URL(string: "https://picsum.photos/400/200")!)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
                .shadow(radius: 10)

            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(HHColors.Black.opacity(0.5))

                VStack(alignment: .leading) {
                    Text(habitName)
                        .font(.title2)
                        .foregroundColor(HHColors.White)

                    Text(habitShortDescription)
                        .font(.subheadline)
                        .foregroundColor(HHColors.White)

                    Button(action: {
                        withAnimation {
                            self.isTracked.toggle()
                        }
                    }) {
                        Text("Track")
                            .fontWeight(.semibold)
                            .foregroundColor(isTracked ? HHColors.Black : HHColors.White)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isTracked ? Color.white.opacity(0.2) : Color.black.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

@ViewBuilder
func asyncImageLoader(url: URL) -> some View {
    AsyncImage(url: url) { phase in
        switch phase {
        case .empty:
            Image("Hplaceholder")
                .resizable() // Resizable placeholder
                .overlay(ProgressView()) // Show loading indication
        case .success(let image):
            image.resizable()
        case .failure:
            Image("Hplaceholder") // Show placeholder if loading fails
        @unknown default:
            Image("Hplaceholder")
        }
    }
}



#Preview {
    ScrollView {
        VStack(alignment: .leading) {
            Text("Most Popular Habits")
                .font(.title)
                .padding()
                .foregroundColor(.black)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    HabitCardView(habitName: "Code", habitShortDescription: "This is a habit to help you learn swift")
                }
                .padding(.horizontal)
            }
        }
    }
}
