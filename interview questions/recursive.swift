//
//  recursive.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 30/10/25.
//

import SwiftUI

struct RecursiveSquares: View {
    var depth: Int
    var body: some View {
        if depth == 0 {
            Rectangle().fill(Color.blue).frame(width: 50, height: 50)
        } else {
            ZStack {
                Rectangle().stroke(Color.black, lineWidth: 6)
                    .fill(Color.blue)
                    .frame(width: CGFloat(50 + depth * 30),
                           height: CGFloat(50 + depth * 30))
                RecursiveSquares(depth: depth - 1)
            }
        }
    }
}

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct GridExample: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<12) { index in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.6))
                        .frame(height: 100)
                        .overlay(Text("\(index)"))
                        .onTapGesture {
                            print(index)
                        }
                }
            }.padding()
        }
    }
}








struct recView : View {
    var depth : Int = 0
    var colors : [Color] = [
        .red,
        .blue,
        .green,
        .orange,
        .yellow,
        .cyan,
        .purple
    ]
    
    
    
    var body: some View {
       
        let colindex = abs(depth)
        let col = colors[colindex]
        
        if depth > 0{
            VStack(spacing: 0){
                HStack(spacing: 0){
                    recView(depth: depth-1)
                    Color.clear
                }
                
                HStack(spacing: 0){
                    Color.clear
                    recView(depth: depth-1)
              
                }
            }
            .background(col)
        }
    }
}



struct recall : View {
    var depths : Int
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
               recView(depth: depths)
                Color.white
            }
            HStack(spacing:0){
                Color.white
                recView(depth: depths)
                
            }
        }
        .padding([.top,.bottom],-50)
    }
}


#Preview {
    RecursiveSquares(depth: 4)
}

#Preview {
    GridExample()
}

#Preview {
    recView(depth: 3)
}


#Preview {
    recall(depths: 4)
    
}
