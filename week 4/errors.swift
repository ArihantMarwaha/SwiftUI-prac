//
//  errors.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 15/10/25.
//

import Foundation

/*
 enum NetworkError: Error {
     case badURL
     case requestFailed
     case decodingFailed
 }
 */

/*
 func fetchData(from urlString: String) throws {
     guard let url = URL(string: urlString) else {
         throw NetworkError.badURL
     }

     // Imagine a failed network request here
     throw NetworkError.requestFailed
 }
 */


//catching errors with do catch
/*
 do {
     try fetchData(from: "invalid-url")
 } catch NetworkError.badURL {
     print("❌ Invalid URL provided.")
 } catch NetworkError.requestFailed {
     print("🚫 Request failed to complete.")
 } catch {
     print("⚠️ Unknown error: \(error)")
 }
 */

//try? and try!

/*

let result = try? fetchData(from: "invalid-url")
// result is nil if error happens

let sureResult = try! fetchData(from: "valid-url")
// will crash if invalid, use only if 100% sure

*/


/*
 func loadData() async throws -> String {
     // pretend to fetch something
     throw NetworkError.requestFailed
 }

 Task {
     do {
         let data = try await loadData()
         print("✅ Loaded: \(data)")
     } catch {
         print("❌ Failed with: \(error)")
     }
 }
*/
