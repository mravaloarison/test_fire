//
//  LogginView.swift
//  FirebaseTesting
//
//  Created by Mami Ravaloarison on 11/14/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LogginView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMsg: String = ""
    
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 60, height: 60)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Group {
                TextField("Email", text: $userEmail)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $userPassword)
            }
            .textFieldStyle(.roundedBorder)
            
            Button {
                print("Clicked")
            } label: {
                Text("Log in")
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
                alertMsg = "Something went wrong when creating user. \(error.localizedDescription)"
                showAlert = true
            }
        }
    }
}

#Preview {
    LogginView()
}
