//
//  RecipeDataSourceTests.swift
//  FetchRecipesTests
//
//  Created by Chris Shireman on 10/7/24.
//

@testable import FetchRecipes
import Foundation
import Testing

@Suite
struct RecipeDataSourceTests {
    private var dataSource: RecipeDataSource
    
    init() {
        dataSource = RecipeDataSourceImpl()
    }
    
    /**
     GIVEN Recipes are being fetched
     WHEN An empty response is received
     THEN An empty RecipeResponse is returned
     */
    @Test func recipeDataSourceCanFetchEmptyRecipes() async throws {
        dataSource.url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
        let response = try await dataSource.fetchRecipes()
        #expect(response.recipes.isEmpty)
    }
    
    /**
     GIVEN Recipes are being fetched
     WHEN A Valid response is received
     THEN The RecipeResponse is returned
     */
    @Test func recipeDataSourceCanFetchRecipes() async throws {
        dataSource.url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
        let response = try await dataSource.fetchRecipes()
        #expect(!response.recipes.isEmpty)
    }
    
    /**
     GIVEN Recipes are being fetched
     WHEN A Malformed response is received
     THEN A MalformedResponse error is thrown
     */
    @Test func recipeDataSourceThrowsExceptionWhenMalformedResponse() async throws {
        dataSource.url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
        await #expect(throws: RecipeError.malformedResponse) {
            let _ = try await dataSource.fetchRecipes()
        }
    }
}
