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
                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50)
            }
            VStack(alignment: .leading) {
                Text(item.title.asStringOrEmpty.trim())
                    .font(.headline)
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
