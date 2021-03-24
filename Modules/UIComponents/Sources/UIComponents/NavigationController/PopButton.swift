//
//  File.swift
//  
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import SwiftUI

public struct PopButton<Label>: View where Label: View {
    
    @EnvironmentObject var viewModel: NavigationViewModel
    
    private let label: () -> Label
    private let destination: PopType
    
    public init(destination: PopType = .prev, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }

    public var body: some View {
        label().onTapGesture {
            viewModel.pop(to: destination)
        }
        
    }
    
}
