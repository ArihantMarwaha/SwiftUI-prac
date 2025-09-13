//
//  counter.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct counter: View {
    @State var count : Int = 0
    @State var warning : Bool = false
    var body: some View {
        
        VStack{
            HStack{
                Text("The counter is :")
                    .font(.largeTitle)
                    .fontWidth(.expanded)
                    .bold()
                
                Text("\(count)")
                    .font(.largeTitle)
                    .id(count)
                    .transition(.scale.animation(.bouncy))
                    .animation(.spring, value: count)
                    .fontWidth(.expanded)
                    .bold()
            }
            .padding()
            
            
            if warning{
                Text("The counter can't be less than 0")
                    .fontWidth(.expanded)
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .bold()
            }
            
            
            
            HStack{
                Button("+"){count+=1;warning = false}
                    .fontWidth(.expanded)
                    .font(.largeTitle)
                    .foregroundStyle(Color.green)
                    .padding()
                Button("-"){if count>0{count-=1;warning=false}else{warning=true}}
                    .fontWidth(.expanded)
                    .font(.largeTitle)
                    .foregroundStyle(Color.red)
                    .padding()
                Button("Resset"){count=0}
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
