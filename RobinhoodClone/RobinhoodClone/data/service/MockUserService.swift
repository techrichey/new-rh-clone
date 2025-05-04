//
//  UserServiceProtocol.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


import Foundation

protocol UserServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

class MockUserService: UserServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if email == "test@example.com" && password == "pass123" {
                let user = User(id: UUID().uuidString, name: "Test User", email: email)
                completion(.success(user))
            } else {
                completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])))
            }
        }
    }
}
