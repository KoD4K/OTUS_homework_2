//
//  File.swift
//  
//
//  Created by Evgenii Plenkin on 21.03.2021.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
    
}

struct ScreenStack {
    
    private var screens:[Screen] = .init()
    
    func top() -> Screen? {
        screens.last
    }
    
    mutating func push(screen: Screen) {
        screens.append(screen)
    }
    
    mutating func pop() {
        _ = screens.popLast()
    }
    
    mutating func toRoot() {
        screens.removeAll()
    }
    
}
