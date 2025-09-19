//
//  fruitdetails.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/09/25.
//

import SwiftUI
import FoundationModels


struct FruitView: View {
    let fruit: String
    
    var body: some View {
        VStack(alignment:.leading){
            Text(fruit)
                .font(.largeTitle)
                .fontWidth(.expanded)
                .padding()
        }
    }
}

struct ruitDetails: View {
    
    @State private var fruitlist: [String] = ["Apple","Mango","Banana","Peach"]
    
    var body: some View {
        NavigationView {
            List(fruitlist, id: \.self) { fruit in
                NavigationLink(fruit, destination: FruitView(fruit: fruit))
            }
            .navigationTitle("Fruits")
        }
    }
}


#Preview {
    ruitDetails()
}
