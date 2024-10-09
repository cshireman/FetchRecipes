//
//  RecipeRepository.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/8/24.
//

protocol RecipeRepository: AnyObject {
    var dataSource: RecipeDataSource { get }
    
    func fetchRecipes() async throws -> [Recipe]
}
