//
//  gestures .swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 03/10/25.
//

import SwiftUI

struct gestures_: View {
    @State private var show = false
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        print("Dragging: \(value.translation)")
                    }
                    .onEnded { _ in
                        print("Drag ended")
                    }
            )

        //.onTapGesture { ... }                // Simple tap
        //.onLongPressGesture { ... }          // Long press
        //.gesture(DragGesture())              // Drag across screen
        //.gesture(MagnificationGesture())     // Pinch to zoom
        //.gesture(RotationGesture())
        VStack {
            Button("Toggle") { show.toggle() }
            
            if show {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green)
                    .animation(.easeInOut(duration: 10), value: show)
                    .frame(width: 200, height: 200)
                    .transition(.slide.combined(with: .opacity))
                    
            }
        }
        //.transition(.opacity)        // fade
        //.transition(.slide)          // slide in/out
        //.transition(.scale)          // grow/shrink
        //.transition(.move(edge: .top))
    }
}

#Preview {
    gestures_()
}
