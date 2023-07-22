//
//  CustomFont.swift
//  Habits
//
//  Created by Miguel Chavez on 7/22/23.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    
    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return "Poppins Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .headline:
            return 17
        case .subheadline:
            return 15
        case .subheadline2:
            return 15
        case .footnote:
            return 13
        case .footnote2:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 12
        }
    }
    
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .subheadline2:
            return .subheadline
        case .footnote:
            return .footnote
        case .footnote2:
            return .footnote
        case .caption:
            return .caption
        case .caption2:
            return .caption
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: relative))
    }
}

extension View {
    func hhFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

enum TextStyle {
    case largeTitle
    case title
    case title2
    case title3
    case body
    case headline
    case subheadline
    case subheadline2
    case footnote
    case footnote2
    case caption
    case caption2
}

struct CustomFont_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            VStack {
                Text("Large Title").hhFont(.largeTitle)
                Text("Title").hhFont(.title)
                Text("Title 2").hhFont(.title2)
                Text("Title 3").hhFont(.title3)
                VStack {
                    Text("Body").hhFont(.body)
                    Text("Headline").hhFont(.headline)
                    Text("Subheadline").hhFont(.subheadline)
                    Text("Subheadline 2").hhFont(.subheadline2)
                    Text("Footnote").hhFont(.footnote)
                    Text("Footnote 2").hhFont(.footnote2)
                    Text("Caption").hhFont(.caption)
                    Text("Caption 2").hhFont(.caption2)
                }
            }
            .padding()
                VStack {
                    Text("Large Title").font(.largeTitle)
                    Text("Title").font(.title)
                    Text("Title 2").font(.title2)
                    Text("Title 3").font(.title3)
                    VStack {
                        Text("Body").font(.body)
                        Text("Headline").font(.headline)
                        Text("Subheadline").font(.subheadline)
                        Text("Subheadline 2").hhFont(.subheadline2)
                        Text("Footnote").font(.footnote)
                        Text("Footnote 2").hhFont(.footnote2)
                        Text("Caption").font(.caption)
                        Text("Caption 2").font(.caption2)
                    }
                }
                .padding()
        }
    }
}
