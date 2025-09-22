//
//  notesapp.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 22/09/25.
//

import SwiftUI


struct notelist:Identifiable {
    
    var id: UUID = UUID()
    var title : String
    var notedecription : String
    
}

struct noteEditView : View {
    @Environment(\.dismiss) var dismiss
    @Binding var toast : notelist
    
    var body: some View {
        
        Form{
            
            TextField("Title",text: $toast.title)
            TextField("Description",text: $toast.notedecription)
            
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Dismiss")
                }
            }
        }
        
    }
}

struct notedesc : View {
    
    @Binding var toast : notelist
    
    var body: some View {
        
        
        VStack{
            Text("\(toast.notedecription)")
                .font(.largeTitle)
                .bold()
                .fontWidth(.expanded)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Edit"){
                    noteEditView(toast: $toast)
                }
            }
            
            
        }
        .navigationTitle(toast.title)
        .navigationBarTitleDisplayMode(.large)
    }
    
}

struct notesapp: View {
    
    @State var notelisted : [notelist]  = [
        notelist(title: "Title 1", notedecription: "This is the decription of the note 1 "),
        
        notelist(title: "Title 2", notedecription: "This is the decription of the note 1 "),
        
        notelist(title: "Title 3", notedecription: "This is the decription of the note 1 ")
        
    ]
    
    var body: some View {
        NavigationStack{
            List($notelisted){$item in
                NavigationLink(item.title,destination: notedesc(toast: $item))
            }
            .navigationTitle("Notes")
        }
        
        
    }

}

#Preview {
    notesapp()
}
