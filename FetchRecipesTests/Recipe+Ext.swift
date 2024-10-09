//
//  Recipe+Ext.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/9/24.
//

@testable import FetchRecipes
import Foundation

extension Recipe {
    static var testingRecipes: [Recipe] {
        return [
            Recipe(cuisine: "American", name: "Cheeseburger", photoUrlLarge: nil, photoUrlSmall: nil, sourceUrl: nil, uuid: UUID(), youtubeUrl: nil)
        ]
    }
}
