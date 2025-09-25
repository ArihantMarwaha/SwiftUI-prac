//
//  VgridsVIEW.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 25/09/25.
//

import SwiftUI

struct gridExample : View {
    let data = Array(1...300)
    
    let columns = [
        GridItem(.fixed(80)),
        GridItem(.flexible()),
        GridItem(.adaptive(minimum:50, maximum: 100))
    ]
    
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(data, id: \.self) { item in
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: 100)
                                .overlay(Text("\(item)").foregroundColor(.white))
                                .onTapGesture {
                                    print(item)
                                }
                        }
                    }
                    .padding()
                }
    }
}

#Preview {
    gridExample()
}
