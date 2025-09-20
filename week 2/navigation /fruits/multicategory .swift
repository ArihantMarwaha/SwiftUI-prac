//
//  multicategory .swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/09/25.
//

import SwiftUI

struct category:Identifiable,Hashable{
    var id : UUID = UUID()
    var categoryName : String
    var subcategory : [String]
}

struct nested : View {
    
    @Binding var selec : category
    
    var body: some View {
        
        NavigationStack{
            List(selec.subcategory,id:\.self){
                sub in Text(sub)
            }
        }
        
    }
}

struct MainCategoryList : View {
    
    
    @State private var mainCategory : [category] = [
        category(categoryName: "Fruits",subcategory: ["Mango","Apple","Banana"]),
        category(categoryName: "Cars",subcategory: ["Mango","Apple","Banana"]),
        category(categoryName: "Phones",subcategory:["Mango","Apple","Banana"])
    ]
    
    
    var body: some View {
        
        NavigationStack{
            
            List($mainCategory,id: \.self){
                $catego in NavigationLink(catego.categoryName,destination: nested(selec: $catego))
            }
        }
        
        
        
    }
}

#Preview{
    MainCategoryList()
}




