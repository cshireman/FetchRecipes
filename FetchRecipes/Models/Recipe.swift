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

extension Recipe: Identifiable {
    var id: UUID {
        return uuid
    }

    var thumbnail: URL? {
        return photoUrlSmall ?? photoUrlLarge
    }
    
    var actionUrl: URL? {
        return sourceUrl ?? youtubeUrl
    }
    
    var hasResources: Bool {
        return sourceUrl != nil || youtubeUrl != nil
    }
}
