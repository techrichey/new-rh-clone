//
//  RobinhoodCloneApp 2.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


// RobinhoodCloneApp.swift
import SwiftUI

@main
struct RobinhoodCloneApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
