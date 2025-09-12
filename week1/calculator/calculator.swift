//
//  calculator.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct Calculator: View {
    @State var number: [Int] = [0, 0, 1]

    // Simple 4-column grid
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        VStack(spacing: 20) {
            // Display
            Text("\(number[1])")
                .font(.system(size: 80, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)

            // Buttons
            LazyVGrid(columns: columns, spacing: 15) {
                Button("AC") {}
                Button("→") {}
                Button("%") {}
                Button("÷") {}

                Button("7") {}
                Button("8") {}
                Button("9") {}
                Button("×") {}

                Button("4") {}
                Button("5") {}
                Button("6") {}
                Button("−") {}

                Button("1") {}
                Button("2") {}
                Button("3") {}
                Button("+") {}

                Button("0") {}
                    .gridCellColumns(2) // make "0" span two columns
                Button(".") {}
                Button("=") {}
            }
            .font(.system(size: 40, weight: .bold))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
        }
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
        .buttonStyle(.bordered)
        .tint(.orange)
    }
}


#Preview {
    Calculator()
}
