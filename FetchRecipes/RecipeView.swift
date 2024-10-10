//
//  RecipeView.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/10/24.
//

import SwiftUI
import NukeUI

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 20) {
            thumbnail
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                    .font(.headline)
                Text(recipe.cuisine)
            }
            
            Spacer()
            
            if recipe.hasResources {
                resourceView
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.blue, lineWidth: 2)
        )
    }
    
    private var thumbnail: some View {
        LazyImage(url: recipe.thumbnail){ state in
            if let image = state.image {
                image.resizable().aspectRatio(contentMode: .fill)
            } else if state.error != nil {
                Color.red // Indicates an error
            } else {
                Color.blue // Acts as a placeholder
            }
        }
        .frame(width: 75, height: 75)
        .clipShape(Circle())
    }
    
    private var resourceView: some View {
        HStack {
            if recipe.youtubeUrl != nil {
                Image(systemName: "play.tv")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            if recipe.sourceUrl != nil {
                Image(systemName: "text.rectangle.page")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}
