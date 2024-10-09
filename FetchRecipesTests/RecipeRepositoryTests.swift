//
//  RecipeRepositoryTests.swift
//  FetchRecipesTests
//
//  Created by Chris Shireman on 10/8/24.
//

@testable import FetchRecipes
import Foundation
import Testing

struct RecipeRepositoryTests {
    private var repository: RecipeRepositoryImpl
    private var dataSource: MockRecipeDataSource
    
    init() {
        dataSource = MockRecipeDataSource()
        repository = RecipeRepositoryImpl(dataSource: dataSource)
    }

    /**
     GIVEN The recipes are being requested from the repository
     THEN The recipes are requested from the DataSource
     */
    @Test func repositoryUsesDataSourceToGetRecipes() async throws {
        let _ = try await repository.fetchRecipes()
        #expect(dataSource.didCallFetchRecipes)
    }
    
    /**
     GIVEN The recipes are requested from the repository
     WHEN A response is received from the DataSource
     THEN return the recipes
     */
    @Test func repositoryReturnsRequestedRecipes() async throws {
        dataSource.mockRecipes = Recipe.testingRecipes
        
        let recipes = try await repository.fetchRecipes()
        #expect(recipes.count == 1)
        #expect(recipes.first?.name == "Cheeseburger")
        #expect(recipes.first?.cuisine == "American")
        #expect(recipes.first?.uuid == dataSource.mockRecipes.first?.uuid)
    }
    
    /**
     GIVEN The recipes have been requested from the Repository
     WHEN The DataSource throws an exception
     THEN The exception is passed to the calling function
     */
    @Test func repositoryThrowsWhenDataSourceThrows() async throws {
        dataSource.exceptionToThrow = RecipeError.malformedResponse
        await #expect(throws: RecipeError.malformedResponse) {
            let _ = try await repository.fetchRecipes()
        }
    }
    
    /**
     GIVEN The recipes have been requested from the Repository
     WHEN The recipes list is empty
     THEN return an empty list of recipes to the caller
     */
    @Test func repositoryReturnsEmptyRecipes() async throws {
        dataSource.mockRecipes = []
        let recipes = try await repository.fetchRecipes()
        #expect(recipes.isEmpty)
    }
}
