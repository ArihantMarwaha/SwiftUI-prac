//
//  dynamicList.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 03/10/25.
//

import SwiftUI

struct dynamicList: View {
    @State private var tasks = ["Study", "Workout", "Read"]
    
    var body: some View {
        NavigationStack{
            List {
                
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete { indexSet in
                    tasks.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    tasks.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Tools")
        }
   
        ScrollView {
            LazyVStack {
                ForEach(0..<1000) { i in
                    Text("Row \(i)")
                        .padding()
                        .background(i % 2 == 0 ? Color.gray.opacity(0.2) : .clear)
                }
            }
        }

    }
}

#Preview {
    dynamicList()
}
