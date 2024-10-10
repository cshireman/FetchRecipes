//
//  EmptyView.swift
//  FetchRecipes
//
//  Created by Chris Shireman on 10/10/24.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image(systemName: "birthday.cake")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Image(systemName: "nosign")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.red)
                    .background(.clear)
            }
            
            Text("We're sorry, no recipes are currently available.  Please check back again later.")
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 40)
    }
}
