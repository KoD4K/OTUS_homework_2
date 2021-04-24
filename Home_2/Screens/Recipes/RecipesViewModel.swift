//
//  RecipeViewModel.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import SwiftUI
import Network

enum MealType: String {
    case salad = "Salad"
    case fish = "Fish"
}

final class RecipesViewModel: ObservableObject {
    
    @Published var currentMeal: MealType = .salad {
        didSet {
            page = 0
            items.removeAll()
            loadPage()
        }
    }
    
    @Published private(set) var items: [Recipe] = .init()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        page += 1
        RecipeAPI.getRecipe(i: "tomato", q: currentMeal.rawValue, p: page) { response, error in
            
            if let results = response?.results {
                print(results)
                self.items.append(contentsOf: results)
            }
            self.isPageLoading = false
        }
        
    }
    
}

