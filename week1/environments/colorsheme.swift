//
//  colorsheme.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 14/09/25.
//

import SwiftUI


struct ThemeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var on : Bool = false

    var body: some View {
        
    
        Text(colorScheme == .dark ? "Dark Mode 🌙" : "Light Mode ☀️")
            .padding()
            .background(colorScheme == .dark ? Color.black : Color.white)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .cornerRadius(10)
    }
}

#Preview { ThemeView() }

struct DismissExample: View {
    @State private var showSheet = false

    var body: some View {
        Button("Open Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss   // provided by SwiftUI

    var body: some View {
        VStack(spacing: 20) {
            Button("Close Sheet") {
                dismiss()
            }
            
            hello_app()
            
        }
        .padding()
    }
}

#Preview { DismissExample() }
