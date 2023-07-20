//
//  HabitStoreView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/20/23.
//

import SwiftUI

struct HabitStoreView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Most Popular Habits")
                            .font(.title)
                            .padding()
                            .foregroundColor(HHColors.Gray)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { _ in
                                    NavigationLink(destination: HabitDetailsView2()) {
                                        HabitCardView_Old(habitName: "Test", habitShortDescription: "Test2")
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Explore by Categories")
                            .font(.title)
                            .padding()
                            .foregroundColor(HHColors.Gray)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { count in
                                    NavigationLink(destination: HabitCategoryView()) {
                                        CategoryIconCardView(categoryName: "Test")
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("Habit Roadmaps")
                            .font(.title)
                            .padding()
                            .foregroundColor(HHColors.Gray)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { _ in
                                    NavigationLink(destination: HabitDetailsView2()) {
                                        RoadmapCardView(roadmapName: "75HARD", roadmapShortDescription: "test", estimatedCompletionTime: "75Days")
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Text("More Habits")
                            .font(.title)
                            .padding()
                            .foregroundColor(HHColors.Black)

                        ForEach(0..<10) { _ in
                            NavigationLink(destination: HabitDetailsView2()) {
                                HabitCardView(habitName: "Test", habitShortDescription: "Test2")
                            }
                        }

                    }
                }
                .navigationTitle("Habit Store")
            }
        }
        .accentColor(HHColors.White)
    }
}



#Preview {
    HabitStoreView()
}
