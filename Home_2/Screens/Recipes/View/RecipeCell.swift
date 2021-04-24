//
//  RecipeCell.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import Network
import SwiftUI
import UIComponents

struct RecipeCell: View {
    
    @EnvironmentObject var viewModel: RecipesViewModel
    
    var item: Recipe
        
    var body: some View {
        HStack {
            if let url = URL(string: item.thumbnail.asStringOrEmpty) {
                AsyncImage<ActivityView>(
                    url: url,
                    placeholder: {ActivityView()}
                )
            }
            VStack(alignment: .leading) {
                Text(item.title.asStringOrEmpty.trim())
                    .font(.headline)
                Text(item.ingredients.asStringOrEmpty)
                    .font(.callout)
                    .foregroundColor(.gray)
                if viewModel.isPageLoading && viewModel.items.isLast(item) {
                    Divider()
                    HStack {
                        Spacer()
                        ActivityView()
                        Spacer()
                    }

                }
            }
        }
    }
    
}
