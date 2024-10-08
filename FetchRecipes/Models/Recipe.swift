//
//  Recipe.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/7/24.
//
import Foundation

struct Recipe: Decodable {
    let cuisine: String
    let name: String
    let photoUrlLarge: URL?
    let photoUrlSmall: URL?
    let sourceUrl: URL?
    let uuid: UUID
    let youtubeUrl: URL?
}
