//
//  POSTandDELETE .swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 09/10/25.
//

import SwiftUI

struct lroduct: Codable {
    var id: Int
    var name: String
    var price: Double
}

enum methods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
    case put = "PUT"
}

class lroducts{
    func postdata() async throws {
        //URL
        guard let url = URL(string: "https://example.com/api/products/\("ID")") else { return }
        
        //response to post
        var request = URLRequest(url: url)
        request.httpMethod = methods.get.rawValue 
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //creating data
        let newProduct = lroduct(id: 201, name: "Smartwatch", price: 149.99)
        //putting data
        request.httpBody = try? JSONEncoder().encode(newProduct)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //handle error
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decode = try JSONDecoder().decode(lroduct.self,from: data)
        print("✅ Product added:", decode.name)
        
    }
}
struct POSTandDELETE_: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    POSTandDELETE_()
}
