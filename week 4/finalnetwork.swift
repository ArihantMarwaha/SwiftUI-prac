//
//  finalnetwork.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 16/10/25.
//

import Foundation


//methods
enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}


//network errors
enum NetworkError: Error, LocalizedError {
    case badURL
    case requestFailed
    case decodingFailed
    case invalidResponse
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .badURL: return "Invalid URL."
        case .requestFailed: return "Network request failed."
        case .decodingFailed: return "Failed to decode response."
        case .invalidResponse: return "Invalid response from server."
        case .serverError(let code): return "Server error: \(code)"
        }
    }
}


//reuseable layers for the manager

final class NetworkManager {
    
    static let shared = NetworkManager() // Singleton
    private init() {}
    
    
    func request<T: Decodable>(
        _ urlString: String,
        method: HTTPMethod = .GET,
        body: Encodable? = nil,
        responseType: T.Type
    ) async throws -> T {
        
        // Step 1: Create URL
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        // Step 2: Create request
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Step 3: Encode request body if present
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        // Step 4: Perform request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Step 5: Validate HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            break
        default:
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        // Step 6: Decode response into T
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}


/*
 
 example useage :
 
 struct Product: Codable, Identifiable {
     let id: Int
     let name: String
     let price: Double
 }

 
 */


//GET EXAMPLE

/*
 Task {
     do {
         let products: [Product] = try await NetworkManager.shared.request(
             "https://example.com/api/products",
             method: .GET,
             responseType: [Product].self
         )
         print(products)
     } catch {
         print("Error: \(error.localizedDescription)")
     }
 }

*/


//POST EXAMPLE
/*
 struct NewProduct: Codable {
     let name: String
     let price: Double
 }

 Task {
     do {
         let new = NewProduct(name: "Phone", price: 799.99)
         let created: Product = try await NetworkManager.shared.request(
             "https://example.com/api/products",
             method: .POST,
             body: new,
             responseType: Product.self
         )
         print("Created product:", created)
     } catch {
         print("Error: \(error.localizedDescription)")
     }
 }
*/

//DELETE EXAMPLE
/*
 struct DeleteResponse: Codable {
     let success: Bool
 }

 Task {
     do {
         let result: DeleteResponse = try await NetworkManager.shared.request(
             "https://example.com/api/products/10",
             method: .DELETE,
             responseType: DeleteResponse.self
         )
         print(result)
     } catch {
         print("Delete failed:", error.localizedDescription)
     }
 }

 
*/



//types of content you can put out there 
/*

 Content-Type: application/json
 Content-Type: application/x-www-form-urlencoded
 Content-Type: multipart/form-data
 Content-Type: text/plain
 
 */
