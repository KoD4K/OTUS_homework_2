//
//  File.swift
//  
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

import SwiftUI

public struct NavigationView<Content>: View where Content: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    public init(transitionType: NavigationTransitionType, animation: Animation = .easeOut(duration: 0.3), @ViewBuilder content: @escaping ()-> Content) {
        
        viewModel = NavigationViewModel(withAnimation: animation)
        self.content = content
        
        switch transitionType {
        case .custom(let transition):
            transitions = (transition, transition)
        default:
            transitions = (.identity, .identity)
        }
    }
    
    public var body: some View {
        
        let isRoot = viewModel.currentScreen == nil
       
        return ZStack {
            if isRoot {
                content
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                    .environmentObject(viewModel)
            }
        }
    }
    
}
