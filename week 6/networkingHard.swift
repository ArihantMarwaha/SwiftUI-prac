//
//  networkingHard.swift
//  SwiftUI prac
//
//  Created by Arihant Marwaha on 23/11/25.
//

import SwiftUI

import SwiftUI
import Observation

// MARK: - Models

struct Prods: Codable, Hashable, Identifiable {
    var id: Int
    var title: String
    var vegetarian: Bool
    var readyInMinutes: Int
    var healthScore: Int
    var image: String?        // spoonacular provides this
}

struct ProductsList: Codable {
    var results: [Prods]
}

// MARK: - ViewModel (Observable)

@Observable
class Food {
    var modeldata: [Prods] = []        // Full dataset
    var showdata: [Prods] = []         // Filtered dataset
    
    var offset = 0
    var lastFilterValue: Int = 0       // Remember slider value
    
    var isLoading = false
    var errorMessage: String? = nil
    
    // MARK: Fetch + Pagination
    func fetchData() async {
        if isLoading { return }
        isLoading = true
        //https://api.spoonacular.com/recipes/complexSearch?apiKey=2ccda33187464f25bc97155e48d8b67f&addRecipeInformation=true&number=10&offset=\(offset)
        guard let url = URL(string:
            ""
        ) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ProductsList.self, from: data)
            
            modeldata.append(contentsOf: decoded.results)
            
            // Reapply previous filter & sort
            combineFilter(num: lastFilterValue)
            
        } catch {
            errorMessage = "Fetch failed: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    // MARK: Filtering
    
    func filterElements(num: Int) {
        lastFilterValue = num
        showdata = modeldata.filter { $0.healthScore >= num }
    }
    
    func sortByHealth() {
        showdata.sort { $0.healthScore > $1.healthScore }
    }
    
    func combineFilter(num: Int) {
        filterElements(num: num)
        sortByHealth()
    }
}

// MARK: - View

struct NetworkingHard: View {
    @State var count = 0.0
    @State var food = Food()
    
    var body: some View {
        VStack {
            
            HStack{
                VStack{
                    Text("Health Filter: \(Int(count))")
                        .font(.title3)
                        .padding(.top, 20)
                    
                    Slider(value: $count, in: 0...100, step: 20) {
                        Text("Health Filter")
                    }
                    .padding(.horizontal, 40)
                    .onChange(of: count) { _, newValue in
                        food.combineFilter(num: Int(newValue))
                    }
                }
                
                Button("Sort"){
                    food.sortByHealth()
                }
                .padding(20)
            }
            
            
            if food.isLoading && food.showdata.isEmpty {
                ProgressView("Loading…")
                    .padding()
            }
            
            if let error = food.errorMessage, food.showdata.isEmpty {
                Text(error)
                    .foregroundStyle(.red)
                    .padding()
            }
            
            List(food.showdata) { item in
                HStack(spacing: 12) {
                    if let url = URL(string: item.image ?? "") {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let img):
                                img.resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            default:
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 60, height: 60)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.headline)
                        Text("Health Score: \(item.healthScore)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .onAppear {
                    // Pagination trigger (safe last item check)
                    if item.id == food.showdata.last?.id {
                        food.offset += 10
                        Task { await food.fetchData() }
                    }
                }
            }
        }
        .task {
            await food.fetchData()
        }
    }
}

#Preview {
    NetworkingHard()
}
