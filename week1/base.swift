//
//  base.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct base: View {
    var body: some View {
        
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 200,height: 200)
            .foregroundStyle(Color.yellow)
            
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWidth(.expanded)
            .bold()
        
            Button("Press this"){
                print("Button tapped")
            }
            .glassEffect(.identity)
            .frame(width: 100,height: 100)
            .foregroundStyle(Color.yellow)
        


        
        
            
           
        
     
        
    }
}

#Preview {
    base()
}
