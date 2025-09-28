//
//  scaleAnimationsView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 28/09/25.
//

import SwiftUI

struct scaleAnimationsView: View {
    @State var scale = 1.0
    @State var rot = false
    @State var angles = 0.0
    
    @Namespace private var ns
    @State private var toggle = false
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Circle()
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1.0)){
                    scale = scale == 1.0 ? 2.0 : 1.0
                }
               
            }
            .padding(50)
        
        
        Slider(value: $angles,in:0...100,step: 1)
            .onChange(of: angles){ newValue in
            angles = Double(newValue)
        }
            .padding(.horizontal,100)
        
        VStack {
                if toggle {
                    Circle()
                        .matchedGeometryEffect(id: "shape", in: ns)
                        .frame(width: 100, height: 100)
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .matchedGeometryEffect(id: "shape", in: ns)
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(Double(angles)))
                }
            }
        .padding()
            .onTapGesture { withAnimation { toggle.toggle() } }
    }
    
    
    
    
    
    
    
}

#Preview {
    scaleAnimationsView()
}
