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
            }
            Spacer()
        }
        if let url = URL(string: item.thumbnail.asStringOrEmpty) {
            PushButton(destination: ImageScreen(imageUrl: url),
                       label: {Text("Show image")})
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(20)
        }
        else {
            Text("There is nothing here")
                .foregroundColor(.blue)
        }
    }
}
