//
//  datapass.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 18/09/25.
//

import SwiftUI

struct mainpass : View {
    
    var item : [String] = ["apple","Banana","Mango"]
    
    var body: some View {
        
        NavigationStack{
            List(item,id: \.self){ item in
                NavigationLink(item, destination: datapass(fruit: item))
            }
            .navigationTitle("fruits")
        }
    }
}

struct datapass: View {
    
    var fruit : String
    
    
    var body: some View {
        Text("You have selected the following fruit : \(fruit)")
    }
}

#Preview {
    mainpass()
}
