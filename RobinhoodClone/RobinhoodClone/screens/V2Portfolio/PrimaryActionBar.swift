//
//  PrimaryActionBar.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//

import SwiftUI


 
struct ActionButton: View {
    let label: String
    let action: () -> Void
    var buttonColor: Color = .white.opacity(0.05)

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.subheadline).bold()
                .frame(maxWidth: .infinity, minHeight: 44)
        }
        .background(buttonColor)
        .foregroundColor(.white)
        .cornerRadius(5)
    }
}

struct PrimaryActionBar: View {
    struct Action { let label: String; let action: () -> Void }
    let actions: [Action]
    var buttonColor: Color = .white.opacity(0.05)

    var body: some View {
        HStack(spacing: 12) {
            ForEach(actions.indices, id: \.self) { i in
                ActionButton(
                    label: actions[i].label,
                    action: actions[i].action,
                    buttonColor: buttonColor
                )
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundGradient()
        PrimaryActionBar(actions: [
            .init(label: "New portfolio +", action: {}),
            .init(label: "Edit", action: {})
        ])
    }
    
}
