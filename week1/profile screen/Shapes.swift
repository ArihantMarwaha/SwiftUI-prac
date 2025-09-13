//
//  Shapes.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


struct Shapes: View {
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            Ellipse()
                .fill(Color.green)
                .frame(width: 150, height: 100)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 120, height: 80)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.purple)
                .frame(width: 120, height: 80)
            
            Capsule()
                .fill(Color.red)
                .frame(width: 150, height: 60)
            
            Triangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    Shapes()
}
