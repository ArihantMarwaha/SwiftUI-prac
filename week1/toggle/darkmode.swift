//
//  darkmode.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

struct GlobalDarkModeView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Toggle("Enable Dark Mode", isOn: $isDarkMode)
                .padding()
                .toggleStyle(SwitchToggleStyle(tint: .blue))
        }
        .padding()
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}


struct GlobalDarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalDarkModeView()
    }
}
