//
//  counter.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct counter: View {
    @State var count : Int = 0
    var body: some View {
        
        VStack{
            
            Text("The counter is ")
                .font(.largeTitle)
                .fontWidth(.expanded)
                .bold()
            
            Text("\(count)")
                .font(.largeTitle)
                .id(count)
                .transition(.scale.animation(.easeInOut))
                .animation(.easeIn, value: count)
                .fontWidth(.expanded)
                .bold()
            
            
            
            HStack{
                Button("+"){count+=1}
                    .fontWidth(.expanded)
                    .font(.largeTitle)
                    .padding()
                Button("-"){count-=1}
                    .fontWidth(.expanded)
                    .font(.largeTitle)
                    .padding()
            }
            
        }
      
        
    }
}

#Preview {
    counter()
}
