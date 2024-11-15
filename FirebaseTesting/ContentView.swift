//
//  ContentView.swift
//  FirebaseTesting
//
//  Created by Mami Ravaloarison on 11/14/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20) {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello world!")
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sign out") {
                        do {
                            try Auth.auth().signOut()
                            dismiss()
                        } catch {
                            print("Something went wrong")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
