//
//  File.swift
//  
//
//  Created by Ian on 21/10/2023.
//

import Foundation

public struct Identifier<T>: Equatable, Hashable, Codable, Sendable {
    public let value: UUID
    
    public init(_ value: UUID = UUID()) {
        self.value = value
    }
    
    public init(_ uuidString: String) {
        self.value = UUID(uuidString: uuidString) ?? UUID()
    }
    
    public init(_ uuidString: String?) {
        self.value = UUID(uuidString: uuidString ?? "") ?? UUID()
    }
}
