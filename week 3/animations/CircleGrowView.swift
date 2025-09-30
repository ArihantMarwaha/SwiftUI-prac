//
//  CircleGrowView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 29/09/25.
//

import SwiftUI

struct CircleGrowView: View {
    
    @State var size = 1.0
    @State var colindex = 0
    var index : [Color] = [.blue,.indigo,.red,.orange,.cyan]

    var body: some View {
        
        Circle()
            .fill(index[colindex])
            .frame(width: 100*size,height: 100*size)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)){
                    if colindex == index.count-1{
                        size = 3.0
                    }
                    else if colindex == 0{
                        size = 1.0
                    }
                    else{
                        size = 2.0
                    }
                    colindex = (colindex+1)%index.count
                   
                }

            }
    }
}

#Preview {
    CircleGrowView()
}
