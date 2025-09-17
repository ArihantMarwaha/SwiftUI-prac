//
//  testingforbind.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 17/09/25.
//

import SwiftUI

@Observable
class bold {
    var bolds : String = ""
    var back : Int = 0
    
    init(bolds: String, back: Int) {
        self.bolds = bolds
        self.back = back
    }
}

@Observable
class boldmain {
    
    var countermodel = bold(bolds: "Arihant", back: 21)

    func disp()->String{
       return countermodel.bolds.uppercased()
    }
    
    func mult()->Int{
        return (countermodel.back * 2)
    }
}

struct boldy : View {
    
    @State private var bolf = boldmain()
    
    var body: some View {
        
        VStack{
            Text(bolf.disp())
                .font(.largeTitle)
                .bold()
            
            Text("the age of the person is \(bolf.mult())")
                .font(.title)
                .foregroundStyle(Color.gray.opacity(0.4))
                .bold()
        }
        
    }
}




struct testingforbind: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    testingforbind()
}
