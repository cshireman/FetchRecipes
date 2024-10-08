//
//  MockRecipeDataSource.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/7/24.
//

@testable import FetchRecipes
import Foundation

class MockRecipeDataSource: RecipeDataSource {
    var url: URL?
    var mockRecipes: [Recipe] = []
    
    func fetchRecipes() async throws -> RecipeResponse {
        return RecipeResponse(recipes: mockRecipes)
    }
}
