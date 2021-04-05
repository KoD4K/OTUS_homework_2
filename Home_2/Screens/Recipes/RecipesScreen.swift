//
//  RecipeScreen.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 04.04.2021.
//

import SwiftUI
import UIComponents

struct RecipesScreen: View {
    
    @ObservedObject var viewModel: RecipesViewModel = .init()
    
    var body: some View {
        NavigationScreen(transitionType: .custom(.moveAndFade)) {
            VStack {
                HStack {
                    Text("Recipes")
                        .font(Font.system(size: 30))
                        .padding(.leading, 20)
                    Spacer()
                }
                List(viewModel.items) { item in
                    PushButton(destination: RecipeScreen()) {
                        RecipeCell(item: item)
                            .environmentObject(viewModel)
                            .onAppear() {
                                if viewModel.items.isLast(item) {
                                    viewModel.loadPage()
                                }
                            }
                            .padding(.trailing, 40)
                    }
                    .padding(.trailing, -40)
                } // List
                .navigationTitle("Recipes")
                .onAppear() {
                    viewModel.loadPage()
                }
            } // VStack
        }
    }
}
