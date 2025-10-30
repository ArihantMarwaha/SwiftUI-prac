//
//  stacks.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI

struct stacks: View {
    var body: some View {
        
        ScrollView{
            
            Text("Vstack")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.largeTitle)
            VStack(alignment:.leading,spacing: 10){
                Text("1")
                Text("2")
            }
            .padding()
            
            
            Text("Hstack")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.largeTitle)
            HStack(spacing: 20) {
                Text("Home")
                Text("Profile")
                Text("Settings")
            }
            .padding()
            
            Text("Zstack")
                .bold()
                .fontWidth(.expanded)
                .fontWeight(.heavy)
                .font(.largeTitle)
            
            ZStack{
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(30)
                    Text("Overlay Text")
                    .font(.subheadline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
            }
            
            
            
            HStack(alignment:.center){
                Text("Arihant")
                    .fontWidth(.expanded)
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Image(systemName:"square.and.arrow.up.fill")
                    .foregroundStyle(.black)
                    .frame(width: 20,height: 20)
                
            }
            
            var houses : [String] = ["House 1","House 2","House 3"]
            ScrollView{
                VStack{
                    Text("House 1")
                        .bold()
                        .fontWidth(.expanded)
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                    Text("Hosue 2")
                        .bold()
                        .fontWidth(.expanded)
                        .fontWeight(.heavy)
                        .font(.title)
                    Text("House 3")
                        .bold()
                        .fontWidth(.expanded)
                        .fontWeight(.heavy)
                        .font(.headline)
                    Text("Hosue 4")
                        .bold()
                        .fontWidth(.expanded)
                        .fontWeight(.heavy)
                        .font(.callout)
                    Text("House 5")
                        .bold()
                        .fontWidth(.expanded)
                        .fontWeight(.heavy)
                        .font(.subheadline)
                    Text("Hosue 6")
                    
                        
                }
            }
            

        }
            
        }
        
}

#Preview {
    stacks()
}
