//
//  ContentView.swift
//  FirebaseTesting
//
//  Created by Mami Ravaloarison on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 60, height: 60)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
