//
//  Functions.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/04/26.
//

import SwiftUI

@Observable
class Functionsport: Identifiable {
    var count : Int
    var items : [Int]
    
    init(count: Int, items: [Int]) {
        self.count = count
        self.items = items
    }
    
    func increment(){
        count += 1
        items.append(count)
    }
}

struct Functions: View {
    
    @State var mano = Functionsport(count: 0,items: [])
    let columns = [GridItem(.adaptive(minimum: 40))]
    
    var body: some View {
        
        VStack{
            
            Text("\(mano.count)")
                .font(.system(size: 100))
                .fontDesign(.monospaced)
                .contentTransition(.numericText(value: Double(mano.count)))
            
            Button{
                withAnimation {
                    mano.increment()
                }
                
            }label: {
                Text("press")
                    .font(.title)
                    .fontDesign(.monospaced)
                    .padding(5)

            }
            .buttonStyle(.glassProminent)
            .tint(.yellow)
            .padding(.top,-50)
            
        }
        .padding(10)
        
        LazyVGrid(columns: columns,spacing: 10){
            ForEach(mano.items,id: \.self){ item in
                Text("\(item)")
                    .font(.system(size: 20))
                    .fontDesign(.monospaced)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .padding()

    }
}

#Preview {
    Functions()
}
