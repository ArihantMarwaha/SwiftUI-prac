//
//  Network Self .swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 06/10/25.
//

import SwiftUI

struct Product: Codable, Identifiable {
    let id: Int
    var name: String
    let description: String
    let price: Double
    let currency: String
    let imageURL: String
    let category: String
    let isAvailable: Bool
    let rating: Rating
    
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

struct ProductResponse: Codable {
    let products: [Product]
}



let datas = """
{
  "products": [
    {
      "id": 101,
      "name": "Margherita Pizza",
      "description": "Classic pizza with mozzarella cheese and tomato sauce.",
      "price": 299.0,
      "currency": "INR",
      "image_url": "https://example.com/images/pizza.jpg",
      "category": "Pizza",
      "is_available": true,
      "rating": {
        "average": 4.5,
        "count": 240
      }
    },
    {
      "id": 102,
      "name": "Paneer Butter Masala",
      "description": "Rich tomato gravy with paneer cubes, served with naan.",
      "price": 199.0,
      "currency": "INR",
      "image_url": "https://example.com/images/paneer.jpg",
      "category": "Indian",
      "is_available": false,
      "rating": {
        "average": 4.2,
        "count": 310
      }
    },
    {
      "id": 103,
      "name": "Veg Burger",
      "description": "Crispy veggie patty with lettuce, tomato, and mayo.",
      "price": 149.0,
      "currency": "INR",
      "image_url": "https://example.com/images/burger.jpg",
      "category": "Fast Food",
      "is_available": true,
      "rating": {
        "average": 4.0,
        "count": 150
      }
    }
  ]
}

"""

@Observable
class ProductsViewModel {
    var products: [Product] = []
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        guard let datar = datas.data(using: .utf8) else { return }
        
        do {
            let decoded = try JSONDecoder().decode(ProductResponse.self, from: datar)
            self.products = decoded.products
        } catch {
            print("Could not fetch data: \(error)")
        }
    }
}

struct Network_Self_: View {
    @State var viewModel = ProductsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.products, id: \.id) { product in
                NavigationLink(destination: DescriptionView(product: product)) {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .bold()
                        Text(product.category)
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Products")
        }
    }
}

struct DescriptionView: View {
    let product: Product
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading) {
                Text(product.description)
                Text("Price: \(product.currency) \(product.price, specifier: "%.2f")")
                    .bold()
            }
            .navigationTitle("\(product.name)")
        }
        
    }
}



#Preview {
    Network_Self_()
}


//steps in networking

//fetch data
/*
 let url = URL(string: "https://api.example.com/products")
 
 optional binding
 
 guard let url = URL(string: "https://api.example.com/products") else {
     print("Invalid URL")
     return
 }
*/

/*

*/

/*

*/

/*

*/
