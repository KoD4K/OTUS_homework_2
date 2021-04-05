//
//  RecipeModel.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import Network

extension Recipe: Identifiable {
    public var id: String {
        href
    }
}
