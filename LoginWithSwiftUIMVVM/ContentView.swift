//
//  ContentView.swift
//  LoginWithSwiftUIMVVM
//
//  Created by Anilkumar on 23/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var loginViewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $loginViewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(.roundedBorder)
            
            if loginViewModel.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    Task() {
                        await loginViewModel.login()
                    }
                }
            }
            if let error = loginViewModel.errorMsgStr {
                Text(error)
                    .foregroundColor(.red)
                    .font(.headline)
            }
            
            if let user = loginViewModel.user {
                Text("User Name \(user.name)")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        }.padding()
    }
}

//#Preview {
//    ContentView()
//}
