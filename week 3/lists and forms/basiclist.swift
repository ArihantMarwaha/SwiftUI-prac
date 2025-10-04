//
//  basiclist.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 03/10/25.
//

import SwiftUI

struct basiclist: View {
    var fruit : [String] = ["Apple","Mango","banana"]
    @State var boar = 0
    @State var datetoday = Date()
    var body: some View {
        List(fruit,id:\.self){ frit in
            Text(frit)
        }
        .toolbar{
            EditButton()
        }
        
        DatePicker("Birthday", selection: .constant(Date()), displayedComponents: .date)
            .padding()
        
        Stepper("Age: \(boar)", value: $boar, in: -20...100)
            .padding()
        
        Picker("Country", selection: .constant("India")) {
            Text("India").tag("India")
            Text("USA").tag("USA")
            Text("Japan").tag("Japan")
        }
        .pickerStyle(.inline)
        
        List{
            Section(header: Text("fruits")){
                Text("Apple")
                Text("Banana")
            }
            Section(header: Text("vegetables")){
                Text("Carrot")
                Text("Broccoli")
                ForEach(fruit,id: \.self){frit in
                    Text(frit)
                }
            }
        }
    }
}

#Preview {
    basiclist()
}
