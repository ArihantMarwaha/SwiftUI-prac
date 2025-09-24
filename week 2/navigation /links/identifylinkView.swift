//
//  identifylinkView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 24/09/25.
//

import SwiftUI

struct ModalData: Identifiable {
    let id = UUID()
    let text: String
}

struct ParentView2: View {
    @State private var activeModal: ModalData?

    var body: some View {
        VStack {
            Button("Open A") { activeModal = ModalData(text: "A") }
            Button("Open B") { activeModal = ModalData(text: "B") }
        }
        .sheet(item: $activeModal) { data in
            Text("Modal with \(data.text)")
                .padding()
        }
    }
}


#Preview {
    ParentView2()
}
