//
//  profile.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 12/09/25.
//

import SwiftUI


struct Profile: View {
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20) {
                // Profile Image
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                
                Text("Arihant Marwaha")
                    .fontWidth(.expanded)
                    .font(.largeTitle)

                // Divider line
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                // Info + Buttons
                HStack(alignment: .top, spacing: 20) {
                    // Text info
                    Text("Hi my name is Arihant.\nThis is some text about me.")
                        .font(.headline)
                        .fontWidth(.expanded)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    // Buttons
                    VStack(spacing: 10) {
                        Button("Follow") {}
                            .buttonStyle(.glass)

                        Button("Message") {}
                            .buttonStyle(.glassProminent)
                            .tint(.green)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
    }
}


#Preview {
    Profile()
}
