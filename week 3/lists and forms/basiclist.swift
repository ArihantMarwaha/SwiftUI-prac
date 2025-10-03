//
//  basiclist.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 03/10/25.
//

import SwiftUI

struct basiclist: View {
    var fruit : [String] = ["Apple","Mango","banana"]
    var body: some View {
        List(fruit,id:\.self){ frit in
            Text(frit)
        }
        .toolbar{
            EditButton()
        }
        
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
