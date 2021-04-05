//
//  RecipeScreen.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 04.04.2021.
//

import SwiftUI
import UIComponents

struct RecipeScreen: View {
    var body: some View {
        VStack {
            HStack {
                PopButton() {
                    Image(systemName: "arrow.backward")
                }
                .padding(.leading, 20)
                Spacer()
            }
            Spacer()
        }
    }
}
