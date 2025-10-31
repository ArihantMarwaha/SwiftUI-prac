//
//  recursive.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 30/10/25.
//

import SwiftUI


struct RecursiveSquaresView: View {
    @State private var depth: Int = 0

    private let baseSize: CGFloat = 60
    private let step: CGFloat = 30
    private let colors: [Color] = [.red, .blue, .green, .orange, .purple, .yellow]

    var body: some View {
        ZStack {
            // Draw outer squares first (so they appear behind)
            ForEach((0...depth).reversed(), id: \.self) { level in
                let size = baseSize + CGFloat(level) * step
                Rectangle()
                    .fill(colors[level % colors.count])
                    .frame(width: size, height: size)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 4))
                    .animation(.spring(response: 0.4, dampingFraction: 0.7), value: depth)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                depth += 1
            }
        }
        .onLongPressGesture {
            withAnimation(.easeOut(duration: 0.3)) {
                depth = 0
            }
        }
    }
}

#Preview {
    RecursiveSquaresView()
}


#Preview {
    RecursiveSquaresView()
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
    RecursiveSquaresView()
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
