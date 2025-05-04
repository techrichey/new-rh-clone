//
//  UserRepository.swift
//  RobinhoodClone
//
//  Created by Alok Gupta on 03/05/25.
//


class UserRepository {
    private let service: UserServiceProtocol

    init(service: UserServiceProtocol = MockUserService()) {
        self.service = service
    }

    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        service.login(email: email, password: password, completion: completion)
    }
}
