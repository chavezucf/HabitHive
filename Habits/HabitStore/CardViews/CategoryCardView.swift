//
//  CategoryCardView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/20/23.
//

import SwiftUI

struct CategoryCardView: View {
    var categoryName: String
    var habitCount: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(HHColors.LightGray)
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                asyncImageLoader(url: URL(string: "https://picsum.photos/400/200")!)
                    .aspectRatio(contentMode: .fit)
                
                Text(categoryName)
                    .font(.title2)
                    .foregroundColor(HHColors.Black)
                    .padding(.vertical)
                
                Text("\(habitCount) Habits")
                    .font(.subheadline)
                    .foregroundColor(HHColors.Black)
                
                Spacer()
                
                NavigationLink(destination: HabitDetailsView2()) {
                    Text("Explore")
                        .fontWeight(.semibold)
                        .foregroundColor(HHColors.Black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct CategoryIconCardView: View {
    var categoryName: String

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(HHColors.Primary)
                .frame(width: 70, height: 50)
                .overlay(
                    Image(systemName: "folder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                )

            Text(categoryName)
                .font(.footnote)
                .foregroundColor(HHColors.Black)
        }
    }
}


#Preview {
    ScrollView {
        VStack(alignment: .leading) {
            Text("Explore by Categories")
                .font(.title)
                .padding()
                .foregroundColor(.black)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CategoryIconCardView(categoryName: "Workout")
                }
                .padding(.horizontal)
            }
        }
    }
}
