//
//  RecipeDataSourceImpl.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/7/24.
//
import Foundation

class RecipeDataSourceImpl: RecipeDataSource {
    var url: URL? = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
    
    func fetchRecipes() async throws -> RecipeResponse {
        guard let url = url else { throw NetworkError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let result = try decoder.decode(RecipeResponse.self, from: data)
            return result
        } catch {
            throw RecipeError.malformedResponse
        }
    }
}
