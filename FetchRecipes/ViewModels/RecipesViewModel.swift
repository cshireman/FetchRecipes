//
//  RecipesViewModel.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/9/24.
//

import SwiftUI

enum RecipesViewState {
    case loading
    case ready
    case empty
    case error
}

@MainActor
class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var state: RecipesViewState = .loading
    
    let repository: RecipeRepository
    
    init(repository: RecipeRepository) {
        self.repository = repository
    }
    
    func loadRecipes() async throws {
        state = .loading
        do {
            recipes = try await repository.fetchRecipes()
            state = recipes.isEmpty ? .empty : .ready
        } catch {
            state = .error
        }
    }
}
