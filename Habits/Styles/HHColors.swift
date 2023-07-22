//
//  HHColors.swift
//  Habits
//
//  Created by Miguel Chavez on 7/22/23.
//

import SwiftUI

import SwiftUI

struct HHColors {
    static let Primary = Color(hex: "#FFB400")
    static let Secondary = Color(hex: "#FFEABF")
    static let Tertiary = Color(hex: "#FFF3DF")
    static let LightAccent = Color(hex: "#87B9E5")
    static let Accent = Color(hex: "#167AD3")
    static let White = Color(hex: "#FFFBFE")
    static let Black = Color(hex: "#151415")
    static let Gray = Color(hex: "#565254")
    static let LightGray = Color(hex: "#BDBCBE")
    
    static let BackgroundD = Color(hex: "#EBEBEB")
    static let BackgroundL = Color(hex: "#F4F4F4")
}

struct ColorsGridView: View {
    // Create an array of colors to display
    let colors: [(Color, String)] = [
        (HHColors.Primary, "Primary"),
        (HHColors.Secondary, "Secondary"),
        (HHColors.Tertiary, "Tertiary"),
        (HHColors.Accent, "Accent"),
        (HHColors.LightAccent, "Light Accent"),
        (.white, "Skip"),
        (HHColors.Black, "Black"),
        (HHColors.Gray, "Gray"),
        (HHColors.LightGray, "Light Gray"),
        (HHColors.BackgroundD, "Background D"),
        (HHColors.BackgroundL, "Background L"),
        (.white, "Skip"),
        (HHColors.White, "White")
    ]

    // Define the layout for the grid
    let layout = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {
        ScrollView {
            ZStack{
                BackgroundGradient()
                VStack{
                    Text("BACK GROUND")
                        .font(.title)
                        .padding(.top)
                    LazyVGrid(columns: layout, spacing: 20) {
                        ForEach(colors, id: \.1) { color, name in
                            VStack {
                                if name != "Skip"{
                                    color
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    
                                    Text(name)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            
            VStack{
                Text("WHITE")
                    .font(.title)
                    .padding(.top)
                LazyVGrid(columns: layout, spacing: 20) {
                    ForEach(colors, id: \.1) { color, name in
                        VStack {
                            if name != "Skip"{
                                color
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                
                                Text(name)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ColorsGridView()
}
