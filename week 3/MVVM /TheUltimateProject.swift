//
//  TheUltimateProject.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 04/10/25.
//

import SwiftUI
import Observation


struct man: Identifiable{
    var id : UUID = UUID()
    var name : String
    var age : Int
    var email : String
}

@Observable
class mandate {
    var mans : [man] = [
        man(name: "Arihant", age: 21, email: "hantakepoli@gmail.com"),
        man(name: "Vansh", age: 20, email: "vanshkepoli@gmail.com"),
        man(name: "Amaan", age: 24, email: "amaankepoli@gmail.com")
    ]
    
    func addnew(name:String){
        let newperson = man(name:name, age: 18, email: "")
        mans.append(newperson)
    }
}

struct TheUltimateProject: View {
    @State var model = mandate()
    
    var body: some View {
        Form{
            Section{
                ForEach($model.mans){
                    $man in
                    HStack{
                        TextField(man.name,text: $man.name)

                        }
                   
                }
            }
        }
    }
}

#Preview {
    TheUltimateProject()
}
