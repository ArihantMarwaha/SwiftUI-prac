//
//  BindingMacro.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/04/26.
//

import SwiftUI

struct BindingMacro: View {
    
    @Binding var side : CGFloat
    
    var body: some View {
        
        //        ZStack {
        //            if side <= 100 {
        //                Circle()
        //                    .stroke()
        //                    .frame(width: side, height: side)
        //                    .animation(.bouncy,value: side)
        //            } else {
        //                Rectangle()
        //                    .stroke()
        //                    .frame(width: side, height: side)
        //                    .animation(.bouncy,value: side)
        //            }
        //        }
        
        ZStack{
            RoundedRectangle(cornerRadius: Int(side) % 3 == 0 ? side / 2 : 0)
                .frame(width: side-30 , height: side-30)
                .animation(.bouncy,value: side)
            
            RoundedRectangle(cornerRadius: Int(side) % 3 == 0 ? side / 2 : 0)
                .stroke()
                .frame(width: side, height: side)
                .animation(.bouncy, value: side)
            
        }
 
    }
}

#Preview {
    BindingMacro(side: .constant(50))
}
