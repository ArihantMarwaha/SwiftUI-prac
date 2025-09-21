//
//  basiclink.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/09/25.
//

import SwiftUI



struct note : View {
    
    var total = [1,3,4,56,54,32]
    
    var body: some View {
        NavigationStack{
            List(total,id: \.self){
                toast in NavigationLink(String(toast),destination: basiclink())
            }
        }
       
    }
}

struct detail : View {
    var body: some View {
        
        Text("")
            .padding(.bottom,30)
        Text("This is a detail view")
            .font(.largeTitle)
            .fontDesign(.monospaced)
            .bold()
        
        Spacer()
          
    }
}

struct basiclink: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("Bose",destination: detail())
            }
            
        }
        .navigationTitle("Detail views")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    note()
}
