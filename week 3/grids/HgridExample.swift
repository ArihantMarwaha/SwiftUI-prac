//
//  HgridExample.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 25/09/25.
//

import SwiftUI

struct HGridExample: View {
    let rows = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    let columns = [
        GridItem(.flexible()),  
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(1..<21) { item in
                    Rectangle()
                        .fill(Color.cyan)
                        .frame(width: 80, height: 80)
                        .clipped()
                        .cornerRadius(20)
                        .overlay(Text("\(item)").foregroundColor(.white))
                }
            }
            .padding()
        }
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                Section(header: Text("Fruits").font(.headline)) {
                    ForEach(["Apple", "Banana", "Mango"], id: \.self) { fruit in
                        Text(fruit)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow.opacity(0.3))
                            .cornerRadius(8)
                    }
                }

                Section(header: Text("Vegetables").font(.headline)) {
                    ForEach(["Carrot", "Lettuce", "Potato"], id: \.self) { veg in
                        Text(veg)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.3))
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }

    }
}


#Preview {
    HGridExample()
}
