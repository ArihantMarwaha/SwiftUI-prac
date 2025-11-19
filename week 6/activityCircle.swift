//
//  activityCircle.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/11/25.
//

import SwiftUI


struct activityCircle: View {
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                // 1. The Activity Ring
                ZStack {
                    // Red "Move" Ring - ENHANCED GRADIENT
                    ActivityRingView(
                        progress: progress,
                        // More prominent gradient colors
                        ringColor: Gradient(colors: [
                            Color(red: 1.0, green: 0.1, blue: 0.3), // Brighter start red
                            Color(red: 0.8, green: 0.0, blue: 0.15) // Deeper end red
                        ]),
                        icon: "arrow.right",
                        ringWidth: 40 // Wider ring
                    )
                    .frame(width: 280, height: 280) // Slightly larger frame for wider ring
                    
                    // Text showing percentage
                    VStack {
                        Text("MOVE")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                        Text("\(Int(progress * 100))%")
                            .font(.system(size: 44, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                
                // 2. Controls to test the animation
                VStack(spacing: 20) {
                    Text("Adjust Progress")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    HStack {
                        Button(action: { withAnimation(.spring(response: 0.7, dampingFraction: 0.75)) { progress = 0 } }) { // Slightly adjusted spring
                            Text("0%")
                                .modifier(ButtonModifier())
                        }
                        Button(action: { withAnimation(.spring(response: 0.7, dampingFraction: 0.75)) { progress = 0.75 } }) {
                            Text("75%")
                                .modifier(ButtonModifier())
                        }
                        Button(action: { withAnimation(.spring(response: 0.7, dampingFraction: 0.75)) { progress = 1.5 } }) {
                            Text("150%")
                                .modifier(ButtonModifier())
                        }
                        Button(action: { withAnimation(.spring(response: 0.7, dampingFraction: 0.75)) { progress = 2.2 } }) {
                            Text("220%")
                                .modifier(ButtonModifier())
                        }
                    }
                    
                    Slider(value: $progress, in: 0...3.0)
                        .accentColor(Color(red: 1.0, green: 0.1, blue: 0.3)) // Match slider accent to ring color
                        .padding(.horizontal)
                }
            }
        }
    }
}

// MARK: - The Core Component
struct ActivityRingView: View {
    var progress: CGFloat
    var ringColor: Gradient
    var icon: String?
    var ringWidth: CGFloat = 20
    
    // Derived value to handle the "Overfill" logic
    private var fill: CGFloat {
        let remainder = progress.truncatingRemainder(dividingBy: 1)
        return (progress > 0 && remainder == 0 && progress.truncatingRemainder(dividingBy: 1) == 0) ? 1.0 : remainder
    }
    
    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            
            ZStack {
                // 1. Background Track (Dark Circle)
                Circle()
                    .stroke(Color(white: 0.15), lineWidth: ringWidth)
                
                // 2. The "Completed Laps" Layer
                if progress > 1.0 {
                    Circle()
                        .stroke(
                            AngularGradient(gradient: ringColor, center: .center, startAngle: .degrees(0), endAngle: .degrees(360)),
                            style: StrokeStyle(lineWidth: ringWidth, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                }
                
                // 3. The Active Progress Arc
                Circle()
                    .trim(from: 0, to: fill)
                    .stroke(
                        AngularGradient(gradient: ringColor, center: .center, startAngle: .degrees(0), endAngle: .degrees(360)),
                        style: StrokeStyle(lineWidth: ringWidth, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                
                // 4. The "Shadow Tip" - ENHANCED SHADOW
                if progress > 0 {
                    Circle()
                        .fill(Color.white.opacity(0.01)) // Make it subtly visible for shadow to work
                        .frame(width: ringWidth, height: ringWidth)
                        .offset(y: -radius)
                        .rotationEffect(Angle.degrees(Double(fill) * 360))
                    // More prominent shadow
                        .shadow(color: Color.black.opacity(0.8), radius: 6, x: 4, y: 0)
                        .overlay(
                            Circle()
                                .fill(AngularGradient(gradient: ringColor, center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                                .frame(width: ringWidth, height: ringWidth)
                                .offset(y: -radius)
                                .rotationEffect(Angle.degrees(Double(fill) * 360))
                        )
                        .opacity(1.0)
                }
                
                // 5. Optional: Icon at the top
                if let iconName = icon {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ringWidth * 0.8, height: ringWidth * 0.8)
                        .foregroundColor(.black)
                        .offset(y: -radius)
                        .opacity(progress > 0.95 ? 0 : 1)
                }
            }
        }
    }
}

// Helper for the demo buttons
struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            .foregroundColor(.white)
            .font(.system(size: 12, weight: .bold))
    }
}

// Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        activityCircle()
    }
}
