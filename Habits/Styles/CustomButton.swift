//
//  CustomButton.swift
//  Habits
//
//  Created by Miguel Chavez on 7/22/23.
//

import SwiftUI

struct CustomButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .padding(.horizontal, 8)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .foregroundStyle(.primary)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

extension View {
    func customButton() -> some View {
        modifier(CustomButton())
    }
}

struct LargeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "F77D8E"))
            .foregroundColor(.white)
            .mask(RoundedCorner(radius: 20, corners: [.topRight, .bottomLeft, .bottomRight]))
            .mask(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
    }
}

extension View {
    func largeButton() -> some View {
        modifier(LargeButton())
    }
}

struct ButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack{
            
            Spacer()
            HStack {
                Image(systemName: "photo")
                Text("Hello, World!")
                    .hhFont(.headline)
            }
            .largeButton()
            
            Spacer()
            HStack {
                Image(systemName: "photo")
                Text("Hello, World!")
                    .hhFont(.headline)
            }
            .customButton()
            
            Spacer()
        }
        .frame(width: 300)
    }
}
