//
//  String.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

extension String {
    
    func trim() -> Self {
        self.filter { !"\n\t\r".contains($0) }
    }
    
}
