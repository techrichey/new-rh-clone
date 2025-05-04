//
//  LoginViewModel.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var user: User?
    @Published var errorMessage: String?

    private let repository: UserRepository

    init(repository: UserRepository = UserRepository()) {
        self.repository = repository
    }

    var formIsValid: Bool {
        email.contains("@") &&
        password.count >= 5 &&
        password.rangeOfCharacter(from: .decimalDigits) != nil
    }

    func login(completion: @escaping (Bool) -> Void) {
        isLoading = true
        errorMessage = nil
        repository.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.user = user
                    completion(true)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    completion(false)
                }
            }
        }
    }
}
