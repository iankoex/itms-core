//
//  ColorComponents.swift
//  ItemsCore
//
//  Created by ian on 12/25/24.
//

import Foundation

public struct ColorComponents: Codable, Sendable, Equatable, Hashable {
    public var r: CGFloat
    public var g: CGFloat
    public var b: CGFloat
    public var o: CGFloat
    
    public init(r: CGFloat, g: CGFloat, b: CGFloat, o: CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.o = o
    }
}
