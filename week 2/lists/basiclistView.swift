//
//  basiclistView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 23/09/25.
//

import SwiftUI

struct basiclistView: View {
    var body: some View {
        
        List{
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }
        
    }
}

struct foreachList : View {
    var fort : [Int] = [1,3,5,2,6,8]
    var body: some View {
        List{
            ForEach(fort,id: \.self){ numbers in
                Text("Number: \(numbers)")
            }
        }
    }
}

struct ser: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct multiView: View {
    let users = [
        User(name: "Alice", age: 25),
        User(name: "Bob", age: 30),
        User(name: "Charlie", age: 22)
    ]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text("\(user.age) years old")
            }
        }
    }
}

//list with sections
struct SectionView: View {
    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                    Text("Apple")
                    Text("Banana")
            }
            Section(header: Text("Vegetables")) {
                Text("Carrot")
                Text("Broccoli")
            }
        }
    }
}

//dynamic list ondelete

struct deleteListView : View {
    @State var fruits : [String] = ["Arihant","Mango","Purple"]
    var body: some View {
        NavigationStack{
            List{
                ForEach(fruits,id: \.self){fruit in
                    Text("\(fruit)")
                }
                .onDelete{
                    index in fruits.remove(atOffsets: index)
                }
            }
            .navigationTitle("Fruits")
            .toolbar{
                EditButton()
            }
            
        }
    }
}

//custom tool row

struct todolistitem : Identifiable{
    var id: UUID = UUID()
    var title : String
    var done : Bool
}

struct todoRows : View {
    @Binding var todo : todolistitem
    var body: some View {
        
        HStack{
            Text(todo.title)
            Spacer()
            Button(action: {todo.done.toggle()}){
                Image(systemName: todo.done ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(todo.done ? .green : .gray)
                    .font(.title2)
            }
        }
        
    }
}

struct todolistmain : View {
    @State private var items : [todolistitem] = [
        todolistitem(title: "Work", done: false),
        todolistitem(title: "Work 2", done: true),
        todolistitem(title: "Work 3", done: true),
        todolistitem(title: "Work 4", done: false)
    ]
    var body: some View {
        
        NavigationStack{
            List{
                ForEach($items) { $item in
                        todoRows(todo: $item)
                }
                .onDelete{
                    index in items.remove(atOffsets: index)
                }
            }
            .navigationTitle("My todo list")
            .toolbar{
                EditButton()
            }
        }
        
        
    }
}



#Preview {
    Group{
        SectionView()
        multiView()
        foreachList()
        basiclistView()
    }

}

#Preview{
    deleteListView()
}

#Preview{
    todolistmain()
}


//custom senect
struct TodoListItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var done: Bool
    var isFavorite: Bool
}

struct TodoListMain: View {
    @State private var items: [TodoListItem] = [
        TodoListItem(title: "Work", done: false, isFavorite: false),
        TodoListItem(title: "Work 2", done: true, isFavorite: true),   // favorite
        TodoListItem(title: "Work 3", done: true, isFavorite: false),
        TodoListItem(title: "Work 4", done: false, isFavorite: true)   // favorite
    ]
    
    @State private var selection = Set<UUID>()   // track selected IDs
    
    var body: some View {
        NavigationStack {
            List(items, selection: $selection) { item in
                HStack {
                    Text(item.title)
                    Spacer()
                    if item.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .environment(\.editMode, .constant(.active)) // always show checkboxes
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete") {
                        deleteSelected()
                    }
                    .disabled(selection.isEmpty)
                }
            }
        }
    }
    
    private func deleteSelected() {
        // filter out selected items but keep favorites even if selected
        items.removeAll { item in
            selection.contains(item.id) && !item.isFavorite
        }
        selection.removeAll()
    }
}

#Preview {
    TodoListMain()
}

