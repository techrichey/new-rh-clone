//
//  AppView.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI
// AppView.swift
struct AppView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            if isLoggedIn {
                HomePageView()
            } else {
                LandingPageView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    AppView()
}
