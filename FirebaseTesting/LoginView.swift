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
    enum Field {
        case userEmail, userPassword
    }
    
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMsg: String = ""
    @FocusState private var focusField: Field?
    
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            Group {
                TextField("Email", text: $userEmail)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .submitLabel(.next)
                    .focused($focusField, equals: .userEmail)
                    .onSubmit {
                        focusField = .userPassword
                    }
                SecureField("Password", text: $userPassword)
                    .submitLabel(.done)
                    .focused($focusField, equals: .userPassword)
                    .onSubmit {
                        focusField = nil
                    }
            }
            .textFieldStyle(.roundedBorder)
            
            Button {
                login()
            } label: {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                register()
            } label: {
                Text("Sign up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .alert(alertMsg, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
        .onAppear {
            checkIfLoggedIn()
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            ContentView()
        }
    }
    
    func checkIfLoggedIn() {
        if Auth.auth().currentUser != nil {
            isLoggedIn = true
        }
    }
    
    func register() {
        guard !userEmail.isEmpty, !userPassword.isEmpty else {
            alertMsg = "Email and Password cannot be empty."
            showAlert = true
            return
        }
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                alertMsg = "\(error.localizedDescription)"
                showAlert = true
            } else {
                isLoggedIn = true
            }
        }
    }
    
    func login() {
        guard !userEmail.isEmpty, !userPassword.isEmpty else {
            alertMsg = "Email and Password cannot be empty."
            showAlert = true
            return
        }
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                alertMsg = "\(error.localizedDescription)"
                showAlert = true
            } else {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    LoginView()
}
