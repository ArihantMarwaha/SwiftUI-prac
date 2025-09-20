//
//  profiletesting.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/09/25.
//

import SwiftUI

struct profiletesting: View {
    
    @State private var toast = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $toast){
            VStack(spacing: 20){
                List{
                    
                    Button("Go to profile"){
                        toast.append("Profile")
                    }
                    
                    Button("Go to settings"){
                        toast.append("Settings")
                    }
                    
                }
                
            }
            .navigationDestination(for: String.self){
                value in
                
                if value == "Profile"{
                    ProfileView()
                }else if value == "Settings"{
                    SettingsView()
                }
            }
            .navigationTitle("Home")
        }
    }
}


struct ProfileView: View {
    var body: some View {
        Text("This is the Profile screen")
            .font(.title)
            .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        Text("This is the Settings screen")
            .font(.title)
            .padding()
    }
}

#Preview {
    profiletesting()
}
