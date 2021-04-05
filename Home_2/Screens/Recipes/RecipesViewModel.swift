//
//  RecipeViewModel.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import SwiftUI
import Network

final class RecipesViewModel: ObservableObject {
    
    @Published private(set) var items: [Recipe] = .init()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        
        isPageLoading = true
        page += 1
        RecipeAPI.getRecipe(i: "potato", q: "salad", p: page) { response, error in
            
            if let results = response?.results {
                print(results)
                self.items.append(contentsOf: results)
            }
            self.isPageLoading = false
        }
        
    }
    
}

