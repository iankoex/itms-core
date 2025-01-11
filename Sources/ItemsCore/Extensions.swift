//
//  Extensions.swift
//  ItemsCore
//
//  Created by Ian on 23/08/2022.
//

extension Array where Element: Hashable {
    public func uniqued() -> [Element] {
        var seen = Set<Element>()
        return filter {
            seen.insert($0).inserted
        }
    }
}

public extension Array {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
