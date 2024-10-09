//
//  RecipeRepositoryImpl.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/8/24.
//

class RecipeRepositoryImpl: RecipeRepository {
    var dataSource: RecipeDataSource
    
    init(dataSource: RecipeDataSource = RecipeDataSourceImpl()) {
        self.dataSource = dataSource
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        let result = try await dataSource.fetchRecipes()
        return result.recipes
    }
}
