//
//  multistepnavigation.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 21/09/25.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let items: [String]
}

struct MultiStepNavigation: View {
    let categories = [
        Category(name: "Fruits", items: ["Apple", "Banana", "Orange"]),
        Category(name: "Cars", items: ["Tesla", "BMW", "Audi"])
    ]
    
    var body: some View {
        NavigationStack {
            List(categories) { category in
                NavigationLink(category.name) {
                    ItemListView(category: category)
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct ItemListView: View {
    let category: Category
    
    var body: some View {
        List(category.items, id: \.self) { item in
            NavigationLink(item) {
                ItemDetailView(item: item)
            }
        }
        .navigationTitle(category.name)
    }
}

struct ItemDetailView: View {
    let item: String
    
    var body: some View {
        Text("Details for \(item)")
            .font(.largeTitle)
            .fontWidth(.expanded)
            .padding()
            .navigationTitle(item)
    }
}

#Preview {
    MultiStepNavigation()
}

