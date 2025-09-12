//
//  stacks.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct stacks: View {
    var body: some View {
        HStack(alignment:.center){
            Text("Arihant")
                .fontWidth(.expanded)
                .bold()
                .font(.largeTitle)
                .padding()
            
            Image(systemName:"square.and.arrow.up.fill")
                .foregroundStyle(.black)
                .frame(width: 20,height: 20)
            
        }
        
        var houses : [String] = ["House 1","House 2","House 3"]
        
        VStack{
            Text("House 1")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.largeTitle)
            Text("Hosue 2")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.title)
            Text("House 3")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.headline)
            Text("Hosue 4")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.callout)
            Text("House 5")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.subheadline)
            Text("Hosue 6")
                
        }

    }
}

#Preview {
    stacks()
}
