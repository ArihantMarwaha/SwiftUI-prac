//
//  sheetView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 24/09/25.
//

import SwiftUI

struct ParentView: View {
    @State private var showSheet = false

    var body: some View {
        Button("Open Sheet") { showSheet = true }
        .sheet(isPresented: $showSheet) {
            todolist()
                .padding(.vertical,-10)
            SheetContent()
        }
    }
}

struct SheetContent: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack{
                Color.blue
                    .opacity(0.5)
                VStack{
                    Button("Close") { dismiss() }
                        .foregroundStyle(Color.white)
                        .offset(x:0,y:-5)
                }
            }
            .frame(height: 90)
            }
        .padding(.bottom,-40)
            
    }
}

#Preview{
    ParentView()
}
