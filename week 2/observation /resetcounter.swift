//
//  resetcounter.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 17/09/25.
//

import SwiftUI

@Observable
class counterform{
    var count : Int = 0
    
    func increment(){
        count += 1
    }
    
    func decrement(){
        count -= 1
    }
    
}

struct resetcounter: View {
    
    @State private var noman = counterform()
    
    var body: some View {
        VStack(alignment:.center,spacing: 30){
            
            HStack{
                Text("the value of the counter: ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontWidth(.expanded)
                Text("\(noman.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontWidth(.expanded)
            }
            
            Button("+"){noman.increment()}
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontWidth(.expanded)
            Button("-"){noman.decrement()}
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontWidth(.expanded)
            
        }
    }
}

#Preview {
    resetcounter()
}
