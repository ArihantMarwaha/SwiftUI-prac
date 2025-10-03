//
//  structuredPicker.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 03/10/25.
//

import SwiftUI

struct structuredPicker: View {
    @State private var selectedColor = "Red"
    let colors = ["Red", "Blue", "Green"]
    var body: some View {
        Form{
            Picker("",selection: $selectedColor){
                ForEach(colors,id: \.self){colors in
                    Text(colors)
                }
            }
        }
    }
}

#Preview {
    structuredPicker()
}
