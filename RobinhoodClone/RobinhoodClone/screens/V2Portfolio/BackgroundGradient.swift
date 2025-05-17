//
//  BackgroundGradient.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 17/05/25.
//

import SwiftUI


struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(hex: "#002D00"), location: 0.0),
                .init(color: Color(hex: "#101010"), location: 0.3),
                .init(color: Color(hex: "#000000"), location: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    
    ZStack {
        BackgroundGradient()
        
    }
    
}


