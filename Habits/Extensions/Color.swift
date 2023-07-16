//
//  Color.swift
//  Habits
//
//  Created by Miguel Chavez on 7/15/23.
//

import SwiftUI

struct HHColors {
    static let Primary = Color(hex: "#FFB400")
    static let Secondary = Color(hex: "#FFD87F")
    static let LightAccent = Color(hex: "#87B9E5")
    static let Accent = Color(hex: "##167AD3")
    static let White = Color(hex: "#FFFBFE")
    static let Black = Color(hex: "#151415")
    static let LightGray = Color(hex: "#BDBCBE")
    static let Gray = Color(hex: "#565254")
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
