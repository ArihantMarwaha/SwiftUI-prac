//
//  profileWizard.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 23/09/25.
//

import SwiftUI


import SwiftUI

// Step 1: Enter Name
struct NameView: View {
    @Binding var name: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step 1: Enter Name")
                .font(.title)
            
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            NavigationLink("Next") {
                AgeView(name: $name, age: 18) // age will be updated
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// Step 2: Pick Age
struct AgeView: View {
    @Binding var name: String
    @State var age: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step 2: Pick Age")
                .font(.title)
            
            Stepper("Age: \(age)", value: $age, in: 1...100)
                .padding()
            
            NavigationLink("Next") {
                ReviewView(name: name, age: age)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// Step 3: Review
struct ReviewView: View {
    let name: String
    let age: Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step 3: Review")
                .font(.title)
            
            Text("Name: \(name)")
            Text("Age: \(age)")
            
            Button("Finish") {
                dismiss() // Dismiss all the way back to Home
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// Home Screen
struct boreView: View {
    @State private var profileName: String = ""
    @State private var profileAge: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                
                if !profileName.isEmpty {
                    Text("👤 Profile: \(profileName), \(profileAge) years old")
                        .padding()
                } else {
                    Text("No profile created yet")
                        .foregroundColor(.gray)
                }
                
                NavigationLink("Create Profile") {
                    NameView(name: $profileName)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    boreView()
}


