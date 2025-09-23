//
//  reviewView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 22/09/25.
//

import SwiftUI

// MARK: - Root (Home)
struct ProfileFlow: View {
    @State private var profileName: String = ""
    @State private var profileAge: Int = 18
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if profileName.isEmpty {
                    Text("No profile yet")
                        .foregroundColor(.gray)
                } else {
                    Text("Profile: \(profileName), \(profileAge)")
                        .font(.title2)
                        .bold()
                }
                
                NavigationLink("Create Profile") {
                    NameStep(name: $profileName, age: $profileAge)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Home")
        }
    }
}

// MARK: - Step 1: Enter Name
struct NameStep: View {
    @Binding var name: String
    @Binding var age: Int
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            NavigationLink("Next") {
                AgeStep(name: $name, age: $age)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Step 1: Name")
    }
}

// MARK: - Step 2: Pick Age
struct AgeStep: View {
    @Binding var name: String
    @Binding var age: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Stepper("Age: \(age)", value: $age, in: 1...100)
                .padding()
            
            NavigationLink("Review") {
                ReviewStep(name: $name, age: $age)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Step 2: Age")
    }
}

// MARK: - Step 3: Review + Finish
struct ReviewStep: View {
    @Environment(\.dismiss) var dismiss
    @Binding var name: String
    @Binding var age: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Review your profile")
                .font(.title2)
                .bold()
            Text("Name: \(name)")
            Text("Age: \(age)")
            
            Button("Finish") {
                dismiss()   // pops ReviewStep → AgeStep
                dismiss()   // pops AgeStep → NameStep
                dismiss()   // pops NameStep → Home
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Step 3: Review")
    }
}

#Preview {
    ProfileFlow()
}
