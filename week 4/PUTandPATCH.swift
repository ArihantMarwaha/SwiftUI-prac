//
//  PUTandPATCH.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 09/10/25.
//

import SwiftUI

struct jroduct: Codable {
    var id: Int
    var name: String
    var price: Double
}

/*
 
 PUT
 func updateProductWithPUT() async throws {
     guard let url = URL(string: "https://example.com/api/products/201") else { return }

     var request = URLRequest(url: url)
     request.httpMethod = "PUT"
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")

     let updatedProduct = Product(id: 201, name: "Smartwatch Ultra", price: 199.99)
     request.httpBody = try JSONEncoder().encode(updatedProduct)

     let (data, response) = try await URLSession.shared.data(for: request)

     guard let http = response as? HTTPURLResponse,
           (200...299).contains(http.statusCode) else {
         throw URLError(.badServerResponse)
     }

     let decoded = try JSONDecoder().decode(Product.self, from: data)
     print("✅ Updated product:", decoded.name)
 }
 
 PATCH
 struct ProductPriceUpdate: Codable {
     var price: Double
 }

 func updateProductPriceWithPATCH() async throws {
     guard let url = URL(string: "https://example.com/api/products/201") else { return }

     var request = URLRequest(url: url)
     request.httpMethod = "PATCH"
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")

     let partialUpdate = ProductPriceUpdate(price: 179.99)
     request.httpBody = try JSONEncoder().encode(partialUpdate)

     let (data, response) = try await URLSession.shared.data(for: request)

     guard let http = response as? HTTPURLResponse,
           (200...299).contains(http.statusCode) else {
         throw URLError(.badServerResponse)
     }

     let decoded = try JSONDecoder().decode(Product.self, from: data)
     print("✅ Price updated to:", decoded.price)
 }


 
 
 */
struct PUTandPATCH: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PUTandPATCH()
}
