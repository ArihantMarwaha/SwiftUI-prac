//
//  dismissview.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/09/25.
//

import SwiftUI


struct dismisskardoongaView : View {
    var body: some View {
        NavigationStack{
            NavigationLink("Go to detials"){
                detailView()
            }
            .glassEffect()
            .padding()

        }
        .navigationTitle("Home")
    }
}


struct detailView : View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("This is a detail View for dismissal")
                .font(.largeTitle)
                .bold()
                .fontWidth(.expanded)
            
            Button("Close"){
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Detials")
        
    }
}


#Preview{
    dismisskardoongaView()
}
