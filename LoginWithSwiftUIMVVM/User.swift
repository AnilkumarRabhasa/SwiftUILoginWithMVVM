//
//  User.swift
//  LoginWithSwiftUIMVVM
//
//  Created by Anilkumar on 23/05/25.
//

struct User: Identifiable {
    var id: String
    var name: String
}

protocol AuthServiceProtocol {
    func login(email: String, password: String) async throws -> User
}

