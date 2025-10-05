//
//  TodoAPP.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 05/10/25.
//

import SwiftUI
import Observation

struct todothing:Identifiable,Hashable{
    var id: UUID = UUID()
    var title : String
    var isDone : Bool
}

@Observable
class TodoItemModel {
    var item : [todothing] = [todothing(title: "Hanta", isDone: false),
                              todothing(title: "Do laundry", isDone: false),
                              todothing(title: "Buy Milk", isDone: false)]
    func additem(title:String){
        let items = todothing(title: title,isDone: false)
        item.append(items)
    }
}

struct Itemrow : View {
    @Binding var base : todothing
    var body: some View {
        HStack{
            Text(base.title)
                .font(.title3.bold().italic())
                .foregroundStyle(base.isDone ? .gray : .black)
            Spacer()
            Image(systemName: base.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundStyle(base.isDone ? .green : .black)
                
        }
    }
}

struct TodoAPP: View {
    @State var basemodel = TodoItemModel()
    @State private var showingAddSheet = false
    @State private var newTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($basemodel.item, id: \.self) { $iteration in
                    Itemrow(base: $iteration)
                        .onTapGesture {
                            iteration.isDone.toggle()
                        }
                }
                .onDelete { indexSet in
                    basemodel.item.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("List items")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                VStack {
                    Text("Add New Task")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .fontWidth(.expanded)
                        .padding()
                    
                    TextField("Enter task", text: $newTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(30)
                        .textCase(.lowercase)
                        .padding()
                    
                    Button("Add") {
                        guard !newTitle.isEmpty else { return }
                        basemodel.additem(title: newTitle)
                        newTitle = ""
                        showingAddSheet = false
                    }
                    .buttonStyle(.glassProminent)
                    .padding(30)
                    
                    Spacer()
                }
                
                .presentationDetents([.medium,.large])
                .padding()
            }
        }
    }
}

#Preview {
    TodoAPP()
}
