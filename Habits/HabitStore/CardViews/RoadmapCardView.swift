//
//  RoadmapCardView.swift
//  Habits
//
//  Created by Miguel Chavez on 7/20/23.
//

import SwiftUI
struct RoadmapCardView_Old: View {
    @State private var isTracked = false
    var roadmapName: String
    var roadmapShortDescription: String
    var estimatedCompletionTime: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(HHColors.Tertiary)
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                asyncImageLoader(url: URL(string: "https://picsum.photos/400/200")!)
                    .aspectRatio(contentMode: .fit)
                
                Text(roadmapName)
                    .font(.title2)
                    .foregroundColor(HHColors.Black)
                    .padding(.vertical)
                
                Text(roadmapShortDescription)
                    .font(.subheadline)
                    .foregroundColor(HHColors.Black)
                
                Text("Estimated completion: \(estimatedCompletionTime)")
                    .font(.caption)
                    .foregroundColor(HHColors.Black)
                
                Spacer()
                
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
struct RoadmapCardView: View {
    @State private var isTracked = false
    var roadmapName: String
    var roadmapShortDescription: String
    var estimatedCompletionTime: String

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
                    Text(roadmapName)
                        .font(.title2)
                        .foregroundColor(HHColors.White)
                        .padding(.vertical)

                    Text(roadmapShortDescription)
                        .font(.subheadline)
                        .foregroundColor(HHColors.White)

                    Text("Estimated completion: \(estimatedCompletionTime)")
                        .font(.caption)
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


#Preview {
    ScrollView {
        VStack(alignment: .leading) {
            Text("Habit Roadmaps")
                .font(.title)
                .padding()
                .foregroundColor(.black)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    RoadmapCardView(roadmapName: "75HARD", roadmapShortDescription: "Test and Stuff about 75HARD", estimatedCompletionTime: "75 Days")
                }
                .padding(.horizontal)
            }
        }
    }
}
