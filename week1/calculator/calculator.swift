//
//  calculator.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct calculator: View {
    @State var number : [Int] = [0,0,1]
    
    var body: some View {
        Text("\(number[1])")
            .font(.system(size: 100))
            .fontWidth(.expanded)
        
        HStack{
            
            VStack{
                HStack{
                    Button("->"){}
                        .font(.system(size: 70))
                        .padding()
                    Button("AC"){}
                        .font(.system(size: 70))
                        .padding()
                    Button("%  "){}
                        .font(.system(size: 70))
                        .padding()
                }
                .glassEffect(.clear)
                .foregroundStyle(.white)
                .tint(.black)
                .padding()
                
                HStack{
                    Button("1  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("2  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("3  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                }
                HStack{
                    Button("4  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("5  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("6  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                }
                HStack{
                    Button("7  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("8  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("9  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                }
                HStack{
                    Button("+/-"){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 60))
                    Button("8  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                    Button("9  "){}
                        .buttonStyle(.glassProminent)
                        .font(.system(size: 70))
                }
              
            }
            
            }
            
        }
        
}

#Preview {
    calculator()
}
