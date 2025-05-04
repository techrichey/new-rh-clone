//
//  DiscoverCardView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI
struct DiscoverCardView: View {
    let title: String
    let subtitle: String
    var trailingText: String? = nil
    var trailingColor: Color = .white
    var icon: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.subheadline.bold())
                Text(subtitle)
                    .foregroundColor(.gray)
                    .font(.caption)
            }

            Spacer()

            if let trailingText = trailingText {
                Text(trailingText)
                    .font(.caption.bold())
                    .foregroundColor(trailingColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(trailingColor.opacity(0.2))
                    .clipShape(Capsule())
            }

            Image(systemName: icon)
                .foregroundColor(.green)
                .font(.title2)
        }
        .padding()
        .background(Color(.secondarySystemBackground).opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
