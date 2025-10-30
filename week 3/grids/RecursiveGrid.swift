//
//  RecursiveGrid.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 30/09/25.
//

import SwiftUI

struct RecursivePatternView: View {
    // The recursion depth.
    let n: Int

    // A static list of colors to cycle through.
    private static let colors: [Color] = [
        .red,
        .blue,
        .green,
        .yellow,
        .purple,
        .orange
    ]

    var body: some View {
        // 1. Base Case: If n is 0, the recursion stops. We return
        // a clear color, which represents the "white" squares.
        if n > 0 {
            // 2. Determine the color for the current level.
            let colorIndex = (n - 1) % Self.colors.count
            let currentColor = Self.colors[colorIndex]
        
            // 3. Recursive Step: Create a 2x2 grid.
            // The top-left and bottom-right cells contain this same view
            // but with a decreased 'n'.
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    // Top-Left (Recursive call)
                    RecursivePatternView(n: n - 1)
                    
                    // Top-Right (Empty)
                    Color.clear
                }
                HStack(spacing: 0) {
                    // Bottom-Left (Empty)
                    Color.clear
                    
                    // Bottom-Right (Recursive call)
                    RecursivePatternView(n: n - 1)
                }
            }
            // The background modifier fills the space behind the next
            // level's pattern, creating the colored squares.
            .background(currentColor)
            
        } else {
            // This is the base case view for n=0.
            Color.clear
        }
    }
}

struct boat : View {
    @State private var n: Double = 1
    
    var body: some View {
        VStack {
            Text("n = \(Int(n))")
                .font(.largeTitle.bold())
            
            RecursivePatternView(n: Int(n))
                .border(Color.primary, width: 2)
                .padding()
            
            Slider(value: $n, in: 1...8, step: 1)
                .padding()
            
        }
        .padding()
    }
}

#Preview{
    boat()
}
