//
//  CustomTextField.swift
//  Habits
//
//  Created by Miguel Chavez on 7/22/23.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var image: Image
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 1).fill(.black.opacity(0.1)))
            .overlay(image.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 8))
    }
}

extension View {
    func hhTextField(image: Image) -> some View {
        modifier(CustomTextField(image: image))
    }
}


struct TextFieldPreview: PreviewProvider {
    static var previews: some View {
        VStack{
            TextField("", text: .constant("me@me.com"))
                .hhTextField(image: Image(systemName: "envelope"))
        }
        .frame(width: 300)
    }
}
