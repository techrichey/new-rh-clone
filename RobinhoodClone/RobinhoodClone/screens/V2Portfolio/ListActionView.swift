//
//  ListActionView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//




import SwiftUI
struct ListActionView: View {
 
    let onTap: () -> Void
    let label: String
    let value : String
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(label)
                    .font(.system(size:13, weight: .bold))
                    .foregroundColor(Color(hex: "#AEBAC1"))
                Spacer()
                Text(value)
                    .font(.system(size:13, weight: .bold))
                    .foregroundColor(.white)
                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundColor(Color.white)
            }
            
            .background(Color.clear)
            .cornerRadius(8)
        }
    }
}
