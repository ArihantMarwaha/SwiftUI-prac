//
//  itemsheet.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 25/09/25.
//

import SwiftUI

struct ModalDatas: Identifiable {
    let id = UUID()
    let text: String
}

struct FullScreenView : View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack{
            
            ScrollView{
                VStack{
                    Color.blue
                        .frame(height: 100)
                        .padding(-10)
                    Color.red
                        .frame(height: 100)
                        .padding(-10)
                    Color.green
                        .padding(-10)
                        .frame(height: 90)
                    Color.blue
                        .frame(height: 100)
                        .padding(-10)
                    Color.red
                        .frame(height: 100)
                        .padding(-10)
                    Color.green
                        .padding(-10)
                        .frame(height: 90)
                    Color.blue
                        .frame(height: 100)
                        .padding(-10)
                    Color.red
                        .frame(height: 100)
                        .padding(-10)
                    Color.green
                        .padding(-10)
                        .frame(height: 90)
                    Color.blue
                        .frame(height: 100)
                        .padding(-10)
                    Color.red
                        .frame(height: 100)
                        .padding(-10)
                    Color.green
                        .padding(-10)
                        .frame(height: 90)
                }
            }
            Button("Dismiss"){
                dismiss()
            }
            .foregroundStyle(Color.white)
            .padding()
            .glassEffect(.clear)
            
        }
        
        
        
    }
}

struct ParentView3: View {
    @State private var activeModal: ModalData?
    @State private var showFull = false
    @State private var showPopover = false

    var body: some View {
        VStack {
            Button("Open A") { activeModal = ModalData(text: "A") }
            Button("Open B") { activeModal = ModalData(text: "B") }
            Button("Full Screen") { showFull = true }
            .fullScreenCover(isPresented: $showFull) {
                FullScreenView()
            }
            Button("Show Popover") { showPopover.toggle() }
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.bottom), arrowEdge: .top) {
                Text("Popover content")
                    .padding()
                    .frame(width: 200, height: 150)
            }

        }
        .sheet(item: $activeModal) { data in
            Text("Modal with \(data.text)")
                .padding()
        }
    }
}

#Preview{
    ParentView3()
}
