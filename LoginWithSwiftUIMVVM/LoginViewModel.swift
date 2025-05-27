//
//  LoginViewModel.swift
//  LoginWithSwiftUIMVVM
//
//  Created by Anilkumar on 25/05/25.
//

import Foundation

@MainActor

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMsgStr: String?
    @Published var user: User?
    
    private let authServiceProtocol: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authServiceProtocol = authService
    }
    
    func login() async {
        do {
            let loginUser = try await authServiceProtocol.login(email: email, password: password)
            user = loginUser
        } catch {
            errorMsgStr = error.localizedDescription
        }
        isLoading = false
        
    }
}
