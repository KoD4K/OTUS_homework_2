//
//  AnyTransition.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 04.04.2021.
//

import SwiftUI

extension AnyTransition {
    
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}
