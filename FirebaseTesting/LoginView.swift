//
//  LoginView.swift
//  FirebaseTesting
//
//  Created by Mami Ravaloarison on 11/14/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMsg: String = ""
    
    var body: some View {
        VStack (spacing: 16) {
            Group {
                TextField("Email", text: $userEmail)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $userPassword)
            }
            .textFieldStyle(.roundedBorder)
            
            Button {
                register()
            } label: {
                Text("Sign in")
            }
        }
        .padding()
        .alert(alertMsg, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    func register() {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) {
            result, error in
            if let error = error {
                alertMsg = "Something went wrong. \(error.localizedDescription)"
                showAlert = true
            } else {
                // TODO: Redirect user
            }
        }
    }
}

#Preview {
    LoginView()
}
