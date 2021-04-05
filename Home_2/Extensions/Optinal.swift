//
//  OptinalExtension.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

extension Optional where Wrapped == String {
    
    var asStringOrEmpty: String {
        self ?? ""
    }
    
}
