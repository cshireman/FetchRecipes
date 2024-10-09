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
    var didCallFetchRecipes = false
    var exceptionToThrow: Error?
    
    func fetchRecipes() async throws -> RecipeResponse {
        if let exception = exceptionToThrow {
            throw exception
        }
        
        didCallFetchRecipes = true
        return RecipeResponse(recipes: mockRecipes)
    }
}
