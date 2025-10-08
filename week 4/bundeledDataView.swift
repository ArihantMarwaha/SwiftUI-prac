//
//  bundeledDataView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 07/10/25.
//

import SwiftUI

struct kroduct: Codable, Identifiable {
    let id: Int
    var name: String
    var description: String
    var price: Double
    var currency: String
    var imageURL: String
    var category: String
    var isAvailable: Bool
    var rating: Rating
    
    struct Rating: Codable {
        let average: Double
        let count: Int
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, price, currency, category, rating
        case imageURL = "image_url"
        case isAvailable = "is_available"
    }
    
    
}

struct kroductResponse: Codable {
    var products: [kroduct] = []
    
}

@Observable
class productdmodel {
    var kroducts: [kroduct] = []
    var filteredProducts: [kroduct] = []
    
    func fetchdata() async {
        do {
            guard let path = Bundle.main.path(forResource: "products_100", ofType: "json") else {
                print("invalid link")
                return
            }
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(kroductResponse.self, from: data)
            self.kroducts = decoded.products
            self.filteredProducts = decoded.products
        } catch {
            print("there was an error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Filtering
    func filterByCategory(_ category: String) {
        filteredProducts = kroducts.filter { $0.category.lowercased() == category.lowercased() }
    }
    
    func filterByAvailability() {
        filteredProducts = kroducts.filter { $0.isAvailable }
    }
    
    func filterByPriceRange(min: Double, max: Double) {
        filteredProducts = kroducts.filter { $0.price >= min && $0.price <= max }
    }
    
    func searchProducts(keyword: String) {
        filteredProducts = kroducts.filter {
            $0.name.localizedCaseInsensitiveContains(keyword) ||
            $0.description.localizedCaseInsensitiveContains(keyword)
        }
    }
    
    // MARK: - Sorting
    func sortByPrice(ascending: Bool = true) {
        filteredProducts.sort { ascending ? $0.price < $1.price : $0.price > $1.price }
    }
    
    func sortByRating() {
        filteredProducts.sort { $0.rating.average > $1.rating.average }
    }
    
    func sortAlphabetically() {
        filteredProducts.sort { $0.name.localizedCompare($1.name) == .orderedAscending }
    }
    
    // MARK: - Reset
    func resetFilters() {
        filteredProducts = kroducts
    }
}



struct bundeledDataView: View {
    
    @State var model = productdmodel()
    
    var body: some View {
        NavigationStack{
            List(model.kroducts,id: \.id){ prod in
                NavigationLink(destination: descriptionproduct(boat:prod)){
                    VStack{
                        Text(prod.name)
                    }
                }
            }
            .navigationTitle("Products")
            .task {
               await model.fetchdata()
            }
        }
       
    }
}


struct descriptionproduct : View {
    let boat : kroduct
    var body: some View {
        VStack{
            Text(boat.name)
                .font(.title)
                .fontWidth(.expanded)
                .bold()
        }
        .navigationTitle(boat.name)
    }
}


struct ndeledDataView: View {
    @State var model = productdmodel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar
                TextField("Search products", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: searchText) { _, newValue in
                        if newValue.isEmpty {
                            model.resetFilters()
                        } else {
                            model.searchProducts(keyword: newValue)
                        }
                    }
                
                // Filter and Sort Buttons
                HStack(){
                    Menu("Filter") {
                        Button("Available Only") { model.filterByAvailability() }
                        Button("Pizza") { model.filterByCategory("Pizza") }
                        Button("Price 100–500") { model.filterByPriceRange(min: 100, max: 500) }
                        Button("Reset Filters") { model.resetFilters() }
                    }
                    .padding()
                    Menu("Sort") {
                        Button("By Price ↑") { model.sortByPrice(ascending: true) }
                        Button("By Price ↓") { model.sortByPrice(ascending: false) }
                        Button("By Rating") { model.sortByRating() }
                        Button("A–Z") { model.sortAlphabetically() }
                    }
                }
                .padding(.horizontal)
                
                // Product List
                List(model.filteredProducts, id: \.id) { prod in
                    NavigationLink(destination: descriptionproduct(boat: prod)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(prod.name)
                                    .font(.headline)
                                Text(prod.category)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("\(prod.price, specifier: "%.2f") \(prod.currency)")
                                    .font(.caption)
                            }
                            Spacer()
                            if !prod.isAvailable {
                                Text("Out of stock")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Products")
            .task { await model.fetchdata() }
        }
    }
}


#Preview {
    bundeledDataView()
    
}

#Preview{
    ndeledDataView()
}


//test push and commit for the old repo 
