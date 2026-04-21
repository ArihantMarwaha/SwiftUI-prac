//
//  StateMacro.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/04/26.
//

import Foundation
import SwiftUI

//Use this when the view owns the data.

struct StateMacro : View {
    
    @State var side : CGFloat = 50
    @State var colourindex = 0
     
    let colours : [Color] = [.blue,.cyan,.yellow,.red]
    
    var body: some View {

        ZStack{
            macrobutton(colourindex: $colourindex, side: $side)
            BindingMacro(side: $side)
        }
    }
}

struct macrobutton : View {
    @Binding var colourindex : Int
    @Binding var side : CGFloat
    let colours : [Color] = [.blue,.cyan,.yellow,.red]
    
    var body: some View {
            colours[colourindex]
                .ignoresSafeArea()
                .opacity(0.4)
                .animation(.easeOut, value: colourindex)
        Button{
            if side <= 300{
                side += 50
            }else{
                side = 50
            }
            
            
            if colourindex >= colours.count-1 {
                colourindex = 0
            }else{
                colourindex += 1
            }
        }label: {
            Text("Press")
                .fontWidth(.expanded)
                .font(.title3)
                .padding()
        }
        .padding()
        .buttonStyle(.glassProminent)
        .padding(.top,500)
        
    }
}


#Preview {
    StateMacro()
}
