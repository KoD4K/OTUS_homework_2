//
//  File.swift
//  
//
//  Created by Evgenii Plenkin on 21.03.2021.
//

import SwiftUI

public enum PopType {
    case prev
    case root
}

public enum NavigationTransitionType {
    case custom(AnyTransition)
    case none
}

enum NavigationType {
    case pop
    case push
}

public final class NavigationViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?

    private var screenStack: ScreenStack = .init() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    var navigationType: NavigationType = .push
    private let animation: Animation
    
    init(withAnimation animation: Animation) {
        self.animation = animation
    }
    
    func push<S: View>(_ screenView: S) {
        withAnimation(animation) {
            navigationType = .push
            let screen: Screen = .init(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen: screen)
        }
    }
    
    func pop(to: PopType = .prev) {
        withAnimation(animation) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.toRoot()
            case .prev:
                screenStack.pop()
            }
        }
    }
    
}
