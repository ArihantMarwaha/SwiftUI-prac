//
//  observe.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 15/09/25.
//

import SwiftUI
import Observation // Required for @Observable

@Observable
class CounterModel {
    var count = 0
}

struct CounterView: View {
    @State private var counter = CounterModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(counter.count)")
                .font(.largeTitle)
            
            Button("Increment") {
                counter.count += 1
            }
        }
    }
}

@Observable
class UserModel {
    var name = ""
}

struct UserForm: View {
    @State private var user = UserModel()
    
    var body: some View {
        VStack {
            TextField("Enter name", text: $user.name) // Binding works!
                .textFieldStyle(.roundedBorder)
            
            Text("Hello, \(user.name)")
        }
        .padding()
    }
}



