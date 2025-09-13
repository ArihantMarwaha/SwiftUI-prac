//
//  bindingtest.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

struct scrollview : View {
    
    @Binding var clone : CGFloat
    @Binding var col : String
    @State var angles : Double
    
    var body: some View {
        
        HStack{
            
            Rectangle()
                .frame(width: clone,height: clone)
                .rotationEffect(.degrees(angles-20))
                .animation(.easeInOut, value: angles)
            
        }
        .frame(width: 300,height: 300)
        .padding(80)
      
        
        
        Slider(value: $clone,in:50...300,step: 10)
            .onChange(of: clone){ newValue in
            angles = Double(newValue)
        }
            .padding(80)
        
        
    }
}

struct bindingtest: View {
    
    @State private var size : CGFloat = 50
    @State private var colour : String = ""
    @State private var ang : Double = 0
    
    
    var body: some View {
        
        VStack{
            
            Text("The size of the circle is : \(Int(size))")
            
            scrollview(clone: $size, col: $colour,angles: 10)
            
        }
        
    }
}

#Preview {
    bindingtest()
}


