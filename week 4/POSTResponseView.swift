//
//  POSTResponseView.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 08/10/25.
//

import SwiftUI

struct hroduct: Codable {
    var id: Int
    var name: String
    var price: Double
    
    
}


 func postProduct() async throws {
     guard let url = URL(string: "https://example.com/api/products") else { return }

     var request = URLRequest(url: url)
     request.httpMethod = "POST" // 👈 important
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")

     let newProduct = hroduct(id: 201, name: "Smartwatch", price: 149.99)
     request.httpBody = try JSONEncoder().encode(newProduct)

     let (data, response) = try await URLSession.shared.data(for: request)

     guard let http = response as? HTTPURLResponse,
           (200...299).contains(http.statusCode) else {
         throw URLError(.badServerResponse)
     }

     let decoded = try JSONDecoder().decode(Product.self, from: data)
     print("✅ Product added:", decoded.name)
 }

 

struct POSTResponseView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    POSTResponseView()
}
