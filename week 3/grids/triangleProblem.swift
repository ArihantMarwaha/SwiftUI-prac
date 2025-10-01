//
//  triangleProblem.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 01/10/25.
//

import SwiftUI

import SwiftUI

// The main view for a single level of the triangle
struct SierpinskiTriangleView: View {
    let n: Int

    var body: some View {
        if n > 0 {
            // A ZStack allows us to place the three sub-triangles
            // correctly within the space of the parent.
            ZStack {
                // Top sub-triangle
                VStack(spacing: 0) {
                    SierpinskiTriangleView(n: n - 1)
                    Spacer()
                }
                
                // Bottom-left and bottom-right sub-triangles
                HStack(spacing: 0) {
                    SierpinskiTriangleView(n: n - 1)
                    Spacer()
                    SierpinskiTriangleView(n: n - 1)
                }
                .padding(.top) // A little padding to align the triangles correctly
            }
        } else {
            // Base case: Draw the smallest triangle.
            // We use a custom shape to draw an equilateral triangle.
            triangle()
        }
    }
}

// A simple Shape for drawing the base triangle
struct triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// The container view with the slider control
struct SierpinskiContentView: View {
    @State private var n: Double = 1

    var body: some View {
        VStack {
            Text("Sierpinski Triangle")
                .font(.largeTitle.bold())
            Text("n = \(Int(n))")
                .font(.headline)
            
            SierpinskiTriangleView(n: Int(n))
                .aspectRatio(1, contentMode: .fit)
                .padding()

            Slider(value: $n, in: 1...8, step: 1)
                .padding()
        }
    }
}

#Preview{
    SierpinskiContentView()
}
