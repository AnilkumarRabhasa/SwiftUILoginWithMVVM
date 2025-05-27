//
//  LoginWithSwiftUIMVVMApp.swift
//  LoginWithSwiftUIMVVM
//
//  Created by Anilkumar on 23/05/25.
//

import SwiftUI

@main
struct LoginWithSwiftUIMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(loginViewModel: LoginViewModel(authService: AuthService()))
        }
    }
}
