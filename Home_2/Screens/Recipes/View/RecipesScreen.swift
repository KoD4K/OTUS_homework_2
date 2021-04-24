//
//  RecipeScreen.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 04.04.2021.
//

import SwiftUI
import UIComponents

struct RecipesScreen: View {
    var meals:[MealType] = [MealType.salad, MealType.fish]
    @ObservedObject var viewModel: RecipesViewModel = .init()
    
    var body: some View {
        NavigationScreen(transitionType: .custom(.moveAndFade)) {
            VStack {
                HStack {
                    Text("Meals")
                        .font(Font.system(size: 30))
                        .padding(.leading, 20)
                    Spacer()
                }
                Picker(selection: $viewModel.currentMeal, label: Text("Choose meal's type")) {
                    ForEach(meals, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                List(viewModel.items) { item in
                    PushButton(destination: RecipeScreen(item: item)) {
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
                .navigationTitle("Meals")
                .onAppear() {
                    viewModel.loadPage()
                }
            } // VStack
        }
    }
}
