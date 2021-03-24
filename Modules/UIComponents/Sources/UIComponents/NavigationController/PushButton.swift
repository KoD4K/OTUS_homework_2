//
//  File.swift
//  
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import SwiftUI

public struct PushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject var viewModel: NavigationViewModel
    
    private let label: () -> Label
    private let destination: Destination
    
    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }

    public var body: some View {
        
        label().onTapGesture {
            viewModel.push(destination)
        }
        
    }
    
}
