//
//  sliderview.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

struct sliderview: View {
    
    @State private var size : CGFloat = 100
    @State private var angle : Double = 15
    
    var body: some View {
        
        
        ZStack{
            Circle()
                .fill(Color.cyan)
                .frame(width: size,height: size)
            
            Rectangle()
                .fill(Color.red)
                .rotationEffect(.degrees(angle))
                .animation(.easeInOut, value: angle)
                .frame(width: size/1.42,height: size/1.42)
            
            Rectangle()
                .fill(Color.yellow)
                .rotationEffect(.degrees(angle-20))
                .animation(.easeInOut, value: angle)
                .frame(width: (size/1.42)/1.42,height: (size/1.42)/1.42)
            
            Rectangle()
                .fill(Color.green)
                .rotationEffect(.degrees(angle-45))
                .animation(.easeInOut, value: angle)
                .frame(width: ((size/1.42)/1.42)/1.42,height: ((size/1.42)/1.42)/1.42)
            
            
                
        }
        
        Slider(value: $size, in: 50...300)
            .onChange(of: size) { newValue in
                angle = Double(newValue) // simple mapping
            }
            .padding(50)

            
        Text("Size of the circle :")
        Text("\(Int(size))")

       
            

    }
}

#Preview {
    sliderview()
}
