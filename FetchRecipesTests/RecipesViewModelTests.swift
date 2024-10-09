//
//  RecipesViewModelTests.swift
//  FetchRecipesTests
//
//  Created by Chris Shireman on 10/9/24.
//

import Combine
@testable import FetchRecipes
import Testing


struct RecipesViewModelTests {
    let repository: MockRecipeRepository
    let viewModel: RecipesViewModel
    
    init() async throws {
        repository = MockRecipeRepository()
        viewModel = await RecipesViewModel(repository: repository)
    }
    
    /**
     GIVEN Recipes are being loaded
     WHEN The recipes are received
     THEN The viewModel recipes variable is updated
     */
    @Test mutating func loadingRecipesUpdatesRecipesVariable() async throws {
        repository.recipes = Recipe.testingRecipes
        try await viewModel.loadRecipes()
        
        await #expect(viewModel.recipes.first?.uuid == repository.recipes.first?.uuid)
    }
    
    /**
     GIVEN Recipes are received
     WHEN The recipes array is empty
     THEN The state is set to ‘empty’
     */
     @Test mutating func loadingEmptyRecipesSetsStateToEmpty() async throws {
         repository.recipes = []
         try await viewModel.loadRecipes()
         
         await #expect(viewModel.state == .empty)
     }

    /**
     GIVEN Recipes are received
     WHEN The recipes array is not empty
     THEN The state is set to ‘ready’
     */
    @Test mutating func loadingRecipesSetsStateToReady() async throws {
        repository.recipes = Recipe.testingRecipes
        try await viewModel.loadRecipes()
        
        await #expect(viewModel.state == .ready)
    }
    
    /**
     GIVEN Recipes are being loaded
     WHEN An exception is raised
     THEN The state is set to ‘error’
     */
    @Test mutating func exceptionSetsStateToError() async throws {
        repository.exception = RecipeError.malformedResponse
        try await viewModel.loadRecipes()
        
        await #expect(viewModel.state == .error)
    }
}
