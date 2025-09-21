//
//  navidanavi.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 18/09/25.
//

import SwiftUI

struct more : View {
    var body: some View {
        
        NavigationStack {
            List{
                NavigationLink("Go to navi 1", destination: navi1())
                NavigationLink("Go to navi 1", destination: navi2())
                NavigationLink("Go to navi 1", destination: navi3())
            }
        }
        
    }
}

struct navi1: View {
    var body: some View {
        Text("this is the navi view 1")
            .font(.largeTitle)
            .bold()
    }
}


struct navi2: View {
    var body: some View {
        Text("this is the navi view 2")
    }
}


struct navi3: View {
    var body: some View {
        Text("this is the navi view 3")
    }
}

#Preview {
    more()
}
