//
//  multibind.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 14/09/25.
//

import SwiftUI


struct multi : View {
    
    @Binding var size : CGFloat
    @Binding var ison : Bool
    
    var body: some View {
        
        Slider(value: $size,in: 10...100,step: 10)
            .padding(80)
            .tint(Color.green)
        
        Toggle("Turn on the theme",isOn: $ison)
            .toggleStyle(SwitchToggleStyle(tint: .pink))
            .padding(.horizontal,40)
        
    }
    
}
struct multibind: View {
    
    @State var size : CGFloat = 10
    @AppStorage("theme") private var theme: Bool = false
    
    var body: some View {
        VStack{
            
            Circle()
                .fill(theme ? Color.white : Color.black)
                .frame(width: size, height: size)
                .padding()
                .animation(.easeInOut(duration: 0.5), value: theme)
            
            multi(size: $size, ison: $theme)
            
        }
        .preferredColorScheme(theme ? .dark : .light)
    }
}

#Preview {
    multibind()
}
