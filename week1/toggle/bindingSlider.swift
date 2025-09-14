//
//  bindingSlider.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 14/09/25.
//

import SwiftUI

struct bindyourslider : View {
    
    @Binding var size : CGFloat
    
    var body: some View {
        
        Slider(value: $size,in: 50...300,step: 30)
            .padding(60)
        
    }
}

struct bindingSlider: View {
    
    @State var size : CGFloat = 100
    
    var body: some View {
        Circle()
            .fill(Color(hue: size/300, saturation: 1, brightness: 1))
            .frame(width: size , height:size)
        bindyourslider(size: $size)
    }
}

#Preview {
    bindingSlider()
}
