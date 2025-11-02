//
//  formsBasic.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 03/10/25.
//

import SwiftUI

struct formsBasic: View {
    @State private var username = ""
    @State private var notifications = true
    @State private var volume = 50.0
    
    var body: some View {
        Form{
            Section(header: Text("Profile")) {
                TextField("Username", text: $username)
                    .autocorrectionDisabled(true)
            }
            
    
            
            Section(header: Text("Preferences")) {
                Toggle("Enable Notifications", isOn: $notifications)
                Slider(value: $volume, in: 0...100)
                HStack{
                    Text("Volume:\(Int(volume))")
                    Spacer()
                    Text("Notification status: \(notifications ?"On":"Off")")
                }
            }
            Section{
                Text("\(username)")
                    .font(.title)
                    .fontWidth(.expanded)
            }
        }
    }
}

#Preview {
    formsBasic()
}
