//
//  counterchildView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

import SwiftUI

// Child view
struct CounterButtonsView: View {
    @Binding var count: Int   // binding to parent’s state

    var body: some View {
        HStack(spacing: 20) {
            Button(action: { count -= 1 }) {
                Text("-")
                    .font(.largeTitle)
                    .frame(width: 60, height: 60)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(12)
            }

            Button(action: { count = 0 }) {
                Text("Reset")
                    .font(.title2)
                    .frame(width: 100, height: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
            }

            Button(action: { count += 1 }) {
                Text("+")
                    .font(.largeTitle)
                    .frame(width: 60, height: 60)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(12)
            }
        }
    }
}

struct buttons : View {
    
    @Binding var vanity : Int
    
    var body: some View {
        HStack{
            Button(action:{vanity*=vanity}){
                Text("%")
                .font(.largeTitle)
                .frame(width: 50,height: 50)
                .background(Color.cyan.opacity(0.5))
                .foregroundStyle(Color.green)
                .cornerRadius(20)
            }
            .padding()
            
            
            Button(action:{vanity = vanity/3}){
                Text("/")
                .font(.largeTitle)
                .frame(width: 50,height: 50)
                .background(Color.cyan.opacity(0.5))
                .foregroundStyle(Color.green)
                .cornerRadius(20)
            }
            .padding()
        }
    }
}

// Parent view
struct CounterWithBindingView: View {
    @State private var counts = 0   // source of truth

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(counts)")
                .font(.largeTitle)
                .bold()
            CounterButtonsView(count: $counts)
            buttons(vanity: $counts)
            
        }
        .padding()
    }
}

#Preview {
    CounterWithBindingView()
}



// Reusable toggle switch
struct CustomToggle: View {
    @Binding var isOn: Bool   // Binding to parent’s state

    var body: some View {
        HStack {
            Text(isOn ? "On" : "Off")
                .foregroundColor(isOn ? .green : .red)
                .font(.title2)

            Spacer()

            Button(action: {
                isOn.toggle()
            }) {
                Circle()
                    .fill(isOn ? Color.green : Color.red)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: isOn ? "checkmark" : "xmark")
                            .foregroundColor(.white)
                    )
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Parent view
struct ToggleDemoView: View {
    @State private var wifiEnabled = false   // Source of truth

    var body: some View {
        VStack(spacing: 30) {
            Text("Wi-Fi is \(wifiEnabled ? "Enabled" : "Disabled")")
                .font(.title)
            
            CustomToggle(isOn: $wifiEnabled)
            // Pass binding
        }
        .padding()
    }
}

#Preview {
    ToggleDemoView()
}
