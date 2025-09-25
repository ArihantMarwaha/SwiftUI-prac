//
//  sheet.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 25/09/25.
//

import SwiftUI

struct ParentView9: View {
    @State private var showSheet = false

    var body: some View {
        Button("Open Sheet") { showSheet = true }
        .sheet(isPresented: $showSheet, onDismiss: {
            print("Sheet dismissed")
        }) {
            SheetContent9()
                .presentationDetents([.large,.medium,.large])
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled()
        }
    }
}

struct SheetContent9: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Sheet")
            Button("Close") { dismiss() }
        }.padding()
    }
}

#Preview{
    ParentView9()
}
