//
//  ShapePickerView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

struct ShapePickerView: View {
    
    @State var shape :String = "Circle"
    @State private var size: CGFloat = 100
    let shapes: [String] = ["Circle","Rectangle","RoundedRec"]
    
    
    var body: some View {
        
        Group {
            switch shape {
            case "Circle":
                Circle()
                    .fill(Color.blue)
                    .frame(width: size, height: size)
            case "Rectangle":
                Rectangle()
                    .fill(Color.green)
                    .frame(width: size, height: size)
            case "RoundedRec":
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.purple)
                    .frame(width: size, height: size)
            default :
                Circle()
                    .fill(Color.red)
                    .frame(width: size, height: size)
            }
        }
        .shadow(radius: 20)
        
        Picker("Select Shape",selection: $shape){
            ForEach(shapes, id: \.self) { shape in
                Text(shape)
            }
        }
        .pickerStyle(.menu)
        .padding(40)
        
        
    }
}

#Preview {
    ShapePickerView()
}
