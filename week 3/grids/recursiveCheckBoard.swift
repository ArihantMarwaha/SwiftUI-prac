//
//  recursiveCheckBoard.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 26/09/25.
//

import SwiftUI


struct Checkerboard: View {
    var size: Int = 2
    var depth: Int = 1
    
    var body: some View {
        Grid {
            ForEach(0..<size, id: \.self) { row in
                GridRow {
                    ForEach(0..<size, id: \.self) { col in
                        cellAt(row: row, col: col)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func cellAt(row: Int, col: Int) -> some View {
        let isDark = (row + col).isMultiple(of: 2)
        
        Rectangle()
            .fill(isDark ? .blue : .red)
            .frame(width: 60, height: 60)
    }
}

struct RecursiveCheckerboard: View {
    var size: Int = 2
    var depth: Int = 2   // controls recursion depth
    
    var body: some View {
        Grid {
            ForEach(0..<size, id: \.self) { row in
                GridRow {
                    ForEach(0..<size, id: \.self) { col in
                        cellAt(row: row, col: col)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func cellAt(row: Int, col: Int) -> some View {
        let isDark = (row + col).isMultiple(of: 2)
        
        if depth > 1 {
            RecursiveCheckerboard(size: size, depth: depth - 1)
                .frame(width: 100, height: 100) // scale down subgrid
        } else {
            Rectangle()
                .fill(isDark ? .blue : .red)
                .frame(width: 100, height: 100)
        }
    }
}



struct recursiveCheckBoard: View {
    var body: some View {
            ScrollView {
                VStack {
                    RecursiveCheckerboard(size: 2, depth: 2) // just 4x4// deeper recursion
                }
            }
        }
}

#Preview {
    recursiveCheckBoard()
}



struct FractalSquare: View {
    let currentLevel: Int
    let maxLevel: Int
    let isPatternA: Bool // Context flag: determines the base color of this quadrant
    let colorA: Color
    let colorB: Color

    var body: some View {
        // Base Case: If we reach the maximum desired recursion level, draw a single solid square.
        if currentLevel >= maxLevel {
            Rectangle()
                // Use the context flag to determine the final color
                .fill(isPatternA ? colorA : colorB)
                .aspectRatio(1, contentMode: .fit)
                .shadow(color: .black.opacity(0.1), radius: 0.5, x: 0, y: 0)
        } else {
            // Recursive Step: Divide the current square into a 2x2 grid.
            // In each quadrant, we recursively call FractalSquare,
            // toggling the `isPatternA` flag for checkerboard effect.
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    // Top-Left: Maintains the current pattern context
                    FractalSquare(
                        currentLevel: currentLevel + 1,
                        maxLevel: maxLevel,
                        isPatternA: isPatternA,
                        colorA: colorA,
                        colorB: colorB
                    )
                    .layoutPriority(1) // Ensures this child takes equal space

                    // Top-Right: Inverts the pattern context
                    FractalSquare(
                        currentLevel: currentLevel + 1,
                        maxLevel: maxLevel,
                        isPatternA: !isPatternA,
                        colorA: colorA,
                        colorB: colorB
                    )
                    .layoutPriority(1) // Ensures this child takes equal space
                }

                HStack(spacing: 0) {
                    // Bottom-Left: Inverts the pattern context
                    FractalSquare(
                        currentLevel: currentLevel + 1,
                        maxLevel: maxLevel,
                        isPatternA: !isPatternA,
                        colorA: colorA,
                        colorB: colorB
                    )
                    .layoutPriority(1) // Ensures this child takes equal space

                    // Bottom-Right: Maintains the current pattern context
                    FractalSquare(
                        currentLevel: currentLevel + 1,
                        maxLevel: maxLevel,
                        isPatternA: isPatternA,
                        colorA: colorA,
                        colorB: colorB
                    )
                    .layoutPriority(1) // Ensures this child takes equal space
                }
            }
            // Ensure the entire recursive block maintains a square aspect ratio
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

/// The main view that controls and displays the recursive fractal pattern.
struct RecursiveFractalView: View {
    // State variable to control the 'level' of recursion.
    @State private var level: Int = 2
    // Limiting the max level to prevent excessive computation (2^N x 2^N cells)
    private let maxLevel = 6
    private let minLevel = 1

    // Custom colors inspired by the uploaded image
    private let colorA = Color(red: 0.1, green: 0.3, blue: 0.4) // Dark Teal
    private let colorB = Color.black

    var body: some View {
        VStack(spacing: 20) {
            Text("Self-Similar $2 \\times 2$ Fractal")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(colorA)
                .multilineTextAlignment(.center)

            // MARK: - Pattern Display
            
            // Start the recursion from the top level (level 1).
            // `isPatternA: true` sets the base color for the top-left quadrant of the first 2x2 split.
            FractalSquare(
                currentLevel: 1,
                maxLevel: level,
                isPatternA: true,
                colorA: colorA,
                colorB: colorB
            )
            .frame(width: 300) // Fixed width for container (making the whole fractal square)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 4)
            )

            // MARK: - Level Controls
            VStack {
                Text("Current Recursion Level: \(level)")
                    .font(.headline)

                HStack(spacing: 20) {
                    Button {
                        if level > minLevel {
                            level -= 1
                        }
                    } label: {
                        ControlLabel(text: "Decrease Level (\(level - 1))", iconName: "minus.circle.fill")
                    }
                    .disabled(level == minLevel)

                    Button {
                        if level < maxLevel {
                            level += 1
                        }
                    } label: {
                        ControlLabel(text: "Increase Level (\(level + 1))", iconName: "plus.circle.fill")
                    }
                    .disabled(level == maxLevel)
                }
            }
            .padding(.top, 30)
        }
        .padding()
        // Use a background to make the black tiles stand out
        .background(Color.white.ignoresSafeArea())
    }
}

/// Helper view for consistent button styling
struct ControlLabel: View {
    let text: String
    let iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
            Text(text)
        }
        .padding(10)
        .background(Color.teal.opacity(0.8))
        .foregroundColor(.white)
        .cornerRadius(8)
        .shadow(radius: 3)
    }
}

// You can uncomment the following line and place this content inside a file named e.g., ContentView.swift
/*
struct ContentView: View {
    var body: some View {
        RecursiveFractalView()
    }
}
*/


#Preview {
    RecursiveFractalView()
}
