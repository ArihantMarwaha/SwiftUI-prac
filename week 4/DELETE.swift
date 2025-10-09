//
//  DELETE.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 09/10/25.
//

import SwiftUI

/*
 func deleteProduct() async throws {
     guard let url = URL(string: "https://example.com/api/products/201") else { return }

     var request = URLRequest(url: url)
     request.httpMethod = "DELETE"

     let (data, response) = try await URLSession.shared.data(for: request)

     guard let http = response as? HTTPURLResponse,
           (200...299).contains(http.statusCode) else {
         throw URLError(.badServerResponse)
     }

     print("✅ Product deleted successfully. Status: \(http.statusCode)")
 }

 
 struct DeleteResponse: Codable {
     let success: Bool
     let message: String
 }

 func deleteProductWithResponse() async throws {
     guard let url = URL(string: "https://example.com/api/products/201") else { return }

     var request = URLRequest(url: url)
     request.httpMethod = "DELETE"

     let (data, response) = try await URLSession.shared.data(for: request)
     guard let http = response as? HTTPURLResponse,
           (200...299).contains(http.statusCode) else {
         throw URLError(.badServerResponse)
     }

     let decoded = try JSONDecoder().decode(DeleteResponse.self, from: data)
     print("✅ Server says:", decoded.message)
 }

 
 extension NetworkManager {
     static func delete<T: Codable>(_ url: URL, responseType: T.Type) async throws -> T {
         var request = URLRequest(url: url)
         request.httpMethod = "DELETE"

         let (data, response) = try await URLSession.shared.data(for: request)
         guard let http = response as? HTTPURLResponse,
               (200...299).contains(http.statusCode) else {
             throw URLError(.badServerResponse)
         }

         return try JSONDecoder().decode(responseType, from: data)
     }
 }

 */

struct DELETE: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DELETE()
}
