//
//  MockRecipeRepository.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/9/24.
//

@testable import FetchRecipes
import Foundation

class MockRecipeRepository: RecipeRepository {
    var dataSource: RecipeDataSource = MockRecipeDataSource()
    var recipes: [Recipe] = []
    var exception: Error?
    
    func fetchRecipes() async throws -> [Recipe] {
        if let error = exception {
            throw error
        }
        
        return recipes
    }
}
