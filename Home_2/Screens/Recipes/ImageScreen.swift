//
//  ImageScreen.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 05.04.2021.
//

import SwiftUI
import UIComponents

struct ImageScreen: View {
    
    var imageUrl: URL
    
    var body: some View {
        VStack {
            HStack {
                PopButton() {
                    Image(systemName: "arrow.backward")
                }
                .padding(.leading, 20)
                Spacer()
            }
            AsyncImage(url: imageUrl, placeholder: {ActivityView()})            
        }
    }
}

