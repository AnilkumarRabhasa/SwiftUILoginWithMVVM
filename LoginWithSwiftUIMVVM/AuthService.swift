//
//  AuthService.swift
//  LoginWithSwiftUIMVVM
//
//  Created by Anilkumar on 25/05/25.
//

import Foundation

enum AuthError: Error, LocalizedError {
    case invalidCredentials
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        }
    }
}

class AuthService: AuthServiceProtocol {
    
    func login(email: String, password: String) async throws -> User {
        try await Task.sleep(nanoseconds: 1_000_000_00)
        if email.lowercased() == "test@1234" && password == "123456" {
            return(User(id: UUID().uuidString, name: "Test User"))
        } else {
            throw AuthError.invalidCredentials
        }
    }
}
