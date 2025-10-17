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

extension Collection {
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

extension Optional where Wrapped == String {
    public func isEmptyOrWhitespace() -> Bool {
        guard let string = self else {
            return true
        }

        return string.isEmptyOrWhitespace()
    }

    public func isNotEmptyOrWhitespace() -> Bool {
        return !self.isEmptyOrWhitespace()
    }
}

extension String {
    public func isEmptyOrWhitespace() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    public func isNotEmptyOrWhitespace() -> Bool {
        return !self.isEmptyOrWhitespace()
    }
}
