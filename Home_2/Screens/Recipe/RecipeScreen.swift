//
//  RecipeScreen.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 04.04.2021.
//

import SwiftUI
import Network
import UIComponents

struct RecipeScreen: View {
    
    var item: Recipe
    
    var body: some View {
        VStack {
            HStack {
                PopButton() {
                    Image(systemName: "arrow.backward")
                }
                .padding(.leading, 20)
                Spacer()
                HStack {
                    Text(item.title.asStringOrEmpty.trim())
                        .font(.headline)
                        .lineLimit(1)
                        .padding(.trailing, 20)
                    Spacer()
                }
            }
            Spacer()
            Divider()
            VStack {
                HStack {
                    if let url = URL(string: item.thumbnail.asStringOrEmpty) {
                        AsyncImage(url: url, placeholder: {ActivityView()})
                            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                            .padding(.leading, 20)
                    }
                    else {
                        Text("No image")
                            .foregroundColor(.blue)
                            .padding(.leading, 20)
                    }
                    VStack {
                        HStack {
                            Text("Ingredients:")

                            Spacer()
                        }
                        Divider()
                        HStack {
                            Text(item.ingredients.asStringOrEmpty)
                                .font(.callout)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                }
                Divider()
                Spacer()
            }
        }

    }
}

struct RecipeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Recipe(title: "Good News", href: "http://www.recipezaar.com/Good-Newsbad-News-Tuna-Salad-salad-Sandwich-166308", ingredients: "cheddar cheese, cucumber, eggs, tomato, lettuce, mayonnaise, onions, sweet pickle relish, tuna", thumbnail: "http://img.recipepuppy.com/36680.jpg")
        RecipeScreen(item: recipe)
    }
}
