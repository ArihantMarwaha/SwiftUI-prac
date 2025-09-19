//
//  fruitgenerate.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 19/09/25.
//

import SwiftUI
import FoundationModels

@Generable
struct FruitInfo {
  @Guide(description: "Name of the fruit")
  let name: String

  @Guide(description: "A short fact about the fruit with a long paragraph that tells about it in detail")
  let fact: String
}

struct FruitDetails: View {
  let fruit: String
  @State private var info: FruitInfo? = nil
  @State private var loading = false

  var body: some View {
    VStack {
      if let info = info {
        Text(info.name)
          .font(.largeTitle)
        Text(info.fact)
          .padding()
      } else if loading {
        ProgressView()
      } else {
        Text("Tap to fetch info")
      }
    }
    .onAppear {
      fetchFruitInfo()
    }
  }

  func fetchFruitInfo() {
    guard SystemLanguageModel.default.isAvailable else {
      // fallback
      info = FruitInfo(name: fruit, fact: "No on-device model available")
      return
    }
    loading = true
    Task {
      do {
        let session = LanguageModelSession()
        let response = try await session.respond(generating: FruitInfo.self) {
          Prompt("Give me big detailed fact about \(fruit) and then help me understand about it deeply")
        }
        info = response.content
      } catch {
        // handle error
        info = FruitInfo(name: fruit, fact: "Error: \(error.localizedDescription)")
      }
      loading = false
    }
  }
}

struct FruitListView: View {
  let fruitlist = ["Apple", "Mango", "Banana", "Peach"]

  var body: some View {
    NavigationView {
      List(fruitlist, id: \.self) { fruit in
        NavigationLink(fruit) {
          FruitDetails(fruit: fruit)
        }
      }
      .navigationTitle("Fruits")
    }
  }
}

#Preview{
    FruitListView()
}
