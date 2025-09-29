//
//  CircleGrowView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 29/09/25.
//

import SwiftUI

struct CircleGrowView: View {
    
    @State var size = 1.0

    var body: some View {
        
        Circle()
            .fill(Color.indigo)
            .frame(width: 100*size,height: 100*size)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)){
                    size = (size == 1.0) ? 2.0 : 1.0
                }

            }
    }
}

#Preview {
    CircleGrowView()
}
