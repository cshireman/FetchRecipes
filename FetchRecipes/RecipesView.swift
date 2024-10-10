//
//  ContentView.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/7/24.
//

import NukeUI
import SwiftUI

struct RecipesView: View {
    @StateObject var viewModel = RecipesViewModel()
    @State var showError = false
    
    var body: some View {
        NavigationStack {
            mainView
            .navigationTitle("Recipes")
            .refreshable {
                loadRecipes()
            }
        }
        .onAppear {
            loadRecipes()
        }
        .overlay {
            if showError {
                VStack {
                    errorView
                    Spacer()
                }
                .transition(.move(edge: .top))
            }
        }
        .transition(.move(edge: .top))
    }
    
    @ViewBuilder
    private var mainView: some View {
        if viewModel.state == .empty {
            EmptyView()
        } else {
            recipeList
        }
    }
    
    private var recipeList: some View {
        List(viewModel.recipes) { recipe in
            RecipeView(recipe: recipe)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    private var errorView: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .frame(height: 200)
            .padding()
            .overlay {
                VStack {
                    Text("Something went wrong.  Please try again.")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                    Button("Reload") {
                        loadRecipes()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
    }
    
    private func loadRecipes() {
        Task {
            try? await viewModel.loadRecipes()
            showError = viewModel.state == .error
        }
    }
}

#Preview {
    RecipesView()
}
