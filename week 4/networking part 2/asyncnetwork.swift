//
//  asyncnetwork.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 18/10/25.
//

import Foundation
internal import Combine

struct nroduct: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}


@MainActor
class nroductViewModel: ObservableObject {
    @Published var products: [nroduct] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchProducts() async {
        isLoading = true
        errorMessage = nil

        let url = URL(string: "https://fakestoreapi.com/products")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([nroduct].self, from: data)
            products = decoded
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

import SwiftUI

struct nroductListView: View {
    @StateObject private var viewModel = nroductViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading products...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error: \(error)")
                        Button("Retry") {
                            Task { await viewModel.fetchProducts() }
                        }
                    }
                } else {
                    List(viewModel.products) { product in
                        HStack {
                            AsyncImage(url: URL(string: product.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.headline)
                                Text("₹\(product.price, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Products")
            .task { await viewModel.fetchProducts() }
        }
    }
}
