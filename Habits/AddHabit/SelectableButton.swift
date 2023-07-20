//
//  SelectableButton.swift
//  Habits
//
//  Created by Miguel Chavez on 7/16/23.
//

import SwiftUI

struct SelectableButton: View {
    var label: String
    var icon: String? = nil
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(isSelected ? HHColors.Black : HHColors.Black)
                }
                Text(label)
                    .foregroundColor(isSelected ? HHColors.Black : HHColors.Black)
                Spacer()
            }
            .padding()
            
            .background(isSelected ? HHColors.Primary : HHColors.Secondary)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
