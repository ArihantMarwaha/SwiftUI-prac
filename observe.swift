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





@Observable
class Counter {
    var value = 0
    
    func increment() {
        value += 1
    }
    
    func reset() {
        value = 0
    }
}

struct CountView: View {
    @State private var counter = Counter()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(counter.value)")
                .font(.largeTitle)
            
            Button("Increment") {
                counter.increment()
            }
            
            Button("Reset") {
                counter.reset()
            }
        }
    }
}



@Observable
class UserProfile {
    var name = ""
    var age = 18
}

struct ProfileForm: View {
    @State private var profile = UserProfile()
    
    var body: some View {
        Form {
            TextField("Name", text: $profile.name)
            Stepper("Age: \(profile.age)", value: $profile.age, in: 0...100)
            
            Text("Name: \(profile.name), Age: \(profile.age)")
                .padding()
        }
    }
}


@Observable
class TodoItem :Identifiable {
    var title: String
    var done: Bool
    
    init(title: String, done: Bool = false) {
        self.title = title
        self.done = done
    }
}

struct TodoListView: View {
    @State private var todos = [
        TodoItem(title: "Buy milk"),
        TodoItem(title: "Walk dog"),
        TodoItem(title: "Read book")
    ]
    
    var body: some View {
        List($todos) { $todo in
            Toggle(todo.title, isOn: $todo.done)
        }
    }
}

@Observable
class ThemeSettings {
    var isDarkMode = false
}

struct themeView: View {
    @State private var settings = ThemeSettings()
    
    var body: some View {
        ZStack {
            (settings.isDarkMode ? Color.black : Color.white)
                .ignoresSafeArea()
            
            VStack {
                Toggle("Dark Mode", isOn: $settings.isDarkMode)
                    .padding()
                
                Text("Current Mode: \(settings.isDarkMode ? "Dark 🌙" : "Light ☀️")")
                    .foregroundColor(settings.isDarkMode ? .white : .black)
            }
        }
    }
}


