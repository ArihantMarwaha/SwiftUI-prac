//
//  hello app.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct hello_app: View {
    var body: some View {
        Text("Choose your Pokémon!")
            .font(.title)
            .fontWeight(.bold)
            .padding(.bottom,10)
        
        Text("learing Step by Step...")
            .font(.callout)
            .foregroundStyle(.gray)
            .padding(.bottom,20)
        
        ScrollView(.horizontal){
            
            HStack{
                VStack(alignment: .center){
                    Image("hello")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .shadow(radius: 10)
                        .frame(width:300,height: 300)
                    
                    Text("Arihant Marwaha")
                        .padding(.top)
                        .bold()
                        .fontWidth(.expanded)
                        .font(.headline)
                }
                .padding()
                
                VStack(alignment: .center){
                    Image("swapnil")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .shadow(radius: 10)
                        .frame(width:300,height: 300)
                    
                    Text("Swaplnil Dhol")
                        .padding(.top)
                        .bold()
                        .fontWidth(.expanded)
                        .font(.headline)
                }
                .padding()
                
                VStack(alignment: .center){
                    Image("anant")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .shadow(radius: 10)
                        .frame(width:300,height: 300)
                    
                    Text("THE Anant")
                        .padding(.top)
                        .bold()
                        .fontWidth(.expanded)
                        .font(.headline)
                }
                .padding()
                
                
            }
            }
            
            
            
        }
        
    }


#Preview {
    hello_app()
}
