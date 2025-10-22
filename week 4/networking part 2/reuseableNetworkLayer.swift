//
//  reuseableNetworkLayer.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/10/25.
//

import Foundation
internal import Combine
import SwiftUI

struct xroduct: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}

enum ViewState<Data> {
    case idle
    case loading
    case success(Data)
    case failed(Error)
}


@MainActor
class xroductViewModel: ObservableObject {
    @Published var state: ViewState<[Product]> = .idle

    func fetchProducts() async {
        state = .loading
        let url = URL(string: "https://fakestoreapi.com/products")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Product].self, from: data)
            state = .success(decoded)
        } catch {
            state = .failed(error)
        }
    }
}


struct xroductListView: View {
    @StateObject private var viewModel = xroductViewModel()

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Products")
                .task { await viewModel.fetchProducts() }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle:
            Color.clear
        case .loading:
            ProgressView("Loading products...")
        case .success(let products):
            List(products) { products in
          //      xroductRow(product: products)
            }
        case .failed(let error):
            ErrorView(error: error) {
                Task { await viewModel.fetchProducts() }
            }
        }
    }
}

struct xroductRow: View {
    let product: xroduct

    var body: some View {
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

struct ErrorView: View {
    let error: Error
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Error")
                .font(.title2)
                .foregroundColor(.red)
            Text(error.localizedDescription)
                .multilineTextAlignment(.center)
                .padding()
            Button("Retry", action: retryAction)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
