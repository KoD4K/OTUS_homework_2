//
//  RandomAccessCollectionExtension.swift
//  Home_2
//
//  Created by Evgenii Plenkin on 24.03.2021.
//

extension RandomAccessCollection where Self.Element: Identifiable {
    
    func isLast(_ item: Element) -> Bool {
        guard isEmpty == false else {
            return false
        }
        guard let itemIndex = lastIndex(where: {AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        return distance(from: itemIndex, to: endIndex) == 1
    }
    
}
