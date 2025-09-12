//
//  ProfileCardView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 13/09/25.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        
        VStack{
            Image("profile2")
                .resizable()
                .scaledToFill()
                .frame(width: 200,height:200)
                .clipped()
                .clipShape(Circle())
            
            Text("Arihant Marwaha")
                .font(.largeTitle)
                .fontWidth(.expanded)
            
            Text("iOS Developer | Swift Enthusiast | Tech Blogger")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding(.top,30)
        Spacer()
        
        ScrollView(.vertical){
            Text("Arihant Marwaha is an aspiring iOS developer with a forward-driven mindset and a strong commitment to mastering both the fundamentals and advanced concepts of Swift, SwiftUI, and Apple’s broader development ecosystem. Focused on building clean, efficient, and user-friendly applications, he approaches learning with structure and depth, always seeking to understand not just the “how” but the “why” behind every implementation.\n\n His work spans from practical apps like water tracking, breathing exercises, and meal logging to more experimental features that merge daily wellness with interactive digital experiences, including pet-based engagement systems. He combines curiosity with technical discipline, actively exploring frameworks like WebKit, Core Data, and Result Builders while also deepening his understanding of software architecture such as MVVM. \n\nBeyond individual projects, he is developing the habit of systematic thinking, balancing creative ideas with feasibility and scalability. With a long-term vision of becoming a well-rounded developer, he is laying the foundation for building products that are not only functional but also impactful, blending technology with meaningful user experiences.")
                .padding(.all,30)
                .font(.footnote)
                .fontWidth(.expanded)
                
        }
        
    }
        
}

#Preview {
    ProfileCardView()
}
