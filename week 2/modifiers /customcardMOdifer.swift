//
//  customcardMOdifer.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 24/09/25.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

extension View {
    func cardStyle() -> some View {
        self.modifier(CardModifier())
    }
}

struct boldmodifer : ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .cardStyle()
            .font(.largeTitle)
            .fontWidth(.expanded)
    }
}

extension View{
    func boldtext()->some View{
        self.modifier(boldmodifer())
    }
}

struct modiferView: View {
    var body: some View {
        Text("Reusable Style")
            .cardStyle()
            .boldtext()
    }
}

#Preview{
    modiferView()
}
