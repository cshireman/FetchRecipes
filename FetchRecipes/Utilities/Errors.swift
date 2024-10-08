//
//  Errors.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/7/24.
//

import Foundation

enum RecipeError: Error {
    case malformedResponse
}

enum NetworkError: Error {
    case invalidURL
}
