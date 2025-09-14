//
//  textfield.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 14/09/25.
//

import SwiftUI

struct customtextfield : View {
    
    @Binding var text : String
    
    var body: some View {
        
        TextField("Username",text:$text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .autocorrectionDisabled()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(30)

            
    }
}

struct textfield: View {
    @AppStorage("name") var name : String = ""
    var body: some View {
        Text("Hello \(name)")
            .font(.largeTitle)
            .fontWidth(.expanded)
            .fontWeight(.bold)
            .padding(30)
        
        customtextfield(text: $name)
    }
}

#Preview {
    textfield()
}
