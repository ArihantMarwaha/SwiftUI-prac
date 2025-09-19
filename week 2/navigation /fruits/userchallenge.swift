//
//  userchallenge.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/09/25.
//

import SwiftUI

struct User:Hashable,Identifiable{
    var id : UUID = UUID()
    var name : String
    var age : Int
}

struct UserHome : View {
    @Binding var user : User
    var body: some View {
        
        VStack{
            Text("\(user.name)")
                .font(.largeTitle)
                .fontWidth(.expanded)
            
            Text("The user is of age : \(user.age)")
                .font(.subheadline)
                .fontWeight(.heavy)
                .fontWidth(.expanded)
                .foregroundStyle(.gray)
        }
        
    }
}

struct userchallenge: View {
    
    @State var userlist : [User] = [
        User(name: "Arihant", age: 21),
        User(name: "Vansh", age: 20),
        User(name: "Amaan", age: 24),
        User(name: "Sadgav", age: 22)
    ]
    
    
    var body: some View {
        NavigationStack{
            List($userlist,id: \.self){ $usr in
                NavigationLink(usr.name,destination: UserHome(user: $usr))
                
            }
            
        }
        .navigationTitle("Users")
    }
}

#Preview {
    userchallenge()
}
