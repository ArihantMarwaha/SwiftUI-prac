//
//  recursiveCheckBoard.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 26/09/25.
//

import SwiftUI


struct Checkerboard: View {
    var size: Int = 2
    var depth: Int = 1
    
    var body: some View {
        Grid {
            ForEach(0..<size, id: \.self) { row in
                GridRow {
                    ForEach(0..<size, id: \.self) { col in
                        cellAt(row: row, col: col)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func cellAt(row: Int, col: Int) -> some View {
        let isDark = (row + col).isMultiple(of: 2)
        
        Rectangle()
            .fill(isDark ? .black : .white)
            .frame(width: 40, height: 40)
    }
}

struct RecursiveCheckerboard: View {
    var size: Int = 4
    var depth: Int = 2   // controls recursion depth
    
    var body: some View {
        Grid {
            ForEach(0..<size, id: \.self) { row in
                GridRow {
                    ForEach(0..<size, id: \.self) { col in
                        cellAt(row: row, col: col)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func cellAt(row: Int, col: Int) -> some View {
        let isDark = (row + col).isMultiple(of: 2)
        
        if depth > 1 {
            RecursiveCheckerboard(size: size, depth: depth - 1)
                .frame(width: 40, height: 40) // scale down subgrid
        } else {
            Rectangle()
                .fill(isDark ? .black : .white)
                .frame(width: 40, height: 40)
        }
    }
}



struct recursiveCheckBoard: View {
    var body: some View {
            ScrollView {
                VStack {
                    RecursiveCheckerboard(size: 2, depth: 2) // just 4x4// deeper recursion
                }
            }
        }
}

#Preview {
    recursiveCheckBoard()
}
