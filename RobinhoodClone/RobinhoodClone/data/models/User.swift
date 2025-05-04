

//
//  Untitled.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//

import SwiftUI
struct User: Identifiable, Codable {
    var id: String
    var name: String
    var email: String
}



class SessionManager: ObservableObject {
    @AppStorage("userData") private var userData: Data?
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var user: User? {
        get {
            guard let data = userData else { return nil }
            return try? JSONDecoder().decode(User.self, from: data)
        }
        set {
            userData = try? JSONEncoder().encode(newValue)
        }
    }

    func logout() {
        isLoggedIn = false
        userData = nil
    }
}
