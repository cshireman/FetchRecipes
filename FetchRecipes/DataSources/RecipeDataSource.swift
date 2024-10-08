//
//  RecipeDataSource.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/7/24.
//
import Foundation

protocol RecipeDataSource: AnyObject {
    var url: URL? { get set }
    
    func fetchRecipes() async throws -> RecipeResponse
}
