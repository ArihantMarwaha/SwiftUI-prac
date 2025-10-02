import SwiftUI
internal import Combine

// Data structure for a single cell in the maze (no changes)
struct Cell {
    var id = UUID()
    var hasTopWall = true
    var hasBottomWall = true
    var hasLeftWall = true
    var hasRightWall = true
    var wasVisited = false
}

// The main class that holds the maze logic
@MainActor
class MazeGenerator: ObservableObject {
    @Published var grid: [[Cell]] = []
    let rows: Int
    let cols: Int
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        generate()
    }
    
    func generate() {
        grid = Array(repeating: Array(repeating: Cell(), count: cols), count: rows)
        
        var currentRow = Int.random(in: 0..<rows)
        var currentCol = Int.random(in: 0..<cols)
        grid[currentRow][currentCol].wasVisited = true
        
        carvePassage(fromRow: currentRow, fromCol: currentCol)
    }
    
    // This function is now simplified and relies on the corrected helper below
    private func carvePassage(fromRow: Int, fromCol: Int) {
        var neighbors = getUnvisitedNeighbors(row: fromRow, col: fromCol)
        neighbors.shuffle()
        
        for (nextRow, nextCol) in neighbors {
            // Remove walls between current cell and neighbor
            if nextRow < fromRow { // Neighbor is above
                grid[fromRow][fromCol].hasTopWall = false
                grid[nextRow][nextCol].hasBottomWall = false
            } else if nextRow > fromRow { // Neighbor is below
                grid[fromRow][fromCol].hasBottomWall = false
                grid[nextRow][nextCol].hasTopWall = false
            } else if nextCol < fromCol { // Neighbor is to the left
                grid[fromRow][fromCol].hasLeftWall = false
                grid[nextRow][nextCol].hasRightWall = false
            } else if nextCol > fromCol { // Neighbor is to the right
                grid[fromRow][fromCol].hasRightWall = false
                grid[nextRow][nextCol].hasLeftWall = false
            }
            
            grid[nextRow][nextCol].wasVisited = true
            carvePassage(fromRow: nextRow, fromCol: nextCol)
        }
    }
    
    // CORRECTED FUNCTION
    private func getUnvisitedNeighbors(row: Int, col: Int) -> [(Int, Int)] {
        var potentialNeighbors: [(Int, Int)] = []
        if row > 0 { potentialNeighbors.append((row - 1, col)) }
        if row < rows - 1 { potentialNeighbors.append((row + 1, col)) }
        if col > 0 { potentialNeighbors.append((row, col - 1)) }
        if col < cols - 1 { potentialNeighbors.append((row, col + 1)) }
        
        // The filter now correctly checks the grid using the tuple's values
        return potentialNeighbors.filter { r, c in
            !grid[r][c].wasVisited
        }
    }
}

// The view to display the maze (no changes here)
struct MazeContentView: View {
    @StateObject private var mazeGenerator = MazeGenerator(rows: 20, cols: 20)
    
    var body: some View {
        VStack {
            Text("Maze Generation (DFS)")
                .font(.title.bold())

            let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: mazeGenerator.cols)
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<mazeGenerator.rows, id: \.self) { row in
                    ForEach(0..<mazeGenerator.cols, id: \.self) { col in
                        let cell = mazeGenerator.grid[row][col]
                        Rectangle()
                            .fill(Color.clear)
                            .border(width: cell.hasTopWall ? 2 : 0, edges: [.top], color: .primary)
                            .border(width: cell.hasBottomWall ? 2 : 0, edges: [.bottom], color: .primary)
                            .border(width: cell.hasLeftWall ? 2 : 0, edges: [.leading], color: .primary)
                            .border(width: cell.hasRightWall ? 2 : 0, edges: [.trailing], color: .primary)
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
            }
            .padding()

            Button("Generate New Maze") {
                mazeGenerator.generate()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

// CORRECTED EdgeBorder struct
struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            switch edge {
            case .top:
                path.move(to: CGPoint(x: rect.minX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            case .bottom:
                path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            case .leading:
                path.move(to: CGPoint(x: rect.minX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            case .trailing:
                path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            }
        }
        return path.strokedPath(.init(lineWidth: width))
    }
}

// Unchanged View extension
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

#Preview{
    MazeContentView()
}
