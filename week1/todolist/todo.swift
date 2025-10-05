//
//  todo.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 14/09/25.
//

import Foundation
import SwiftUI

struct todoItem : Identifiable{
    var id : UUID = UUID()
    var title : String
    var completed : Bool
}

struct todoRow :View {
    
    @Binding var todo : todoItem
    
    var body: some View {
        
        HStack{
            Text(todo.title)
                .fontWeight(.bold)
                .fontWidth(.expanded)
                .strikethrough(todo.completed,color: .gray )
                .foregroundColor(todo.completed ? .gray : .primary)
            
            Spacer()
            
            Button(action: {todo.completed.toggle()}){
                Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.completed ? .green : .gray)
                    .font(.title2)
            }
            
            
        }
        .cornerRadius(10)
        
    }
}

struct todolist : View {
    
    @State var todos : [todoItem] = [
        todoItem(title: "Buy milk", completed: false),
        todoItem(title: "Go to gym", completed: true),
        todoItem(title: "talk to dad at 3", completed:false),
        todoItem(title: "Complete Assignment", completed: false)
    ]
    
    
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach($todos){
                    $todo in todoRow(todo: $todo)
                }
            }
            .navigationTitle("My to do list")
        }
    }
}



#Preview{
    todolist()
}
