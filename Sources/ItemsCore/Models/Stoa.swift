//
//  Stoa.swift
//  ItemsCore
//
//  Created by Ian on 09/08/2022.
//

import Foundation

public struct Stoa: Identifiable, Codable, Sendable, Equatable, Hashable {
    public var id: Identifier<Self>
    public var name: String
    public var startTime: Date
    // Item Contains the Creator the Community, Description and the Thumbnail
    public var item: Item
    
    public init(id: Identifier<Self> = Identifier(), name: String, startTime: Date, item: Item) {
        self.id = id
        self.name = name
        self.startTime = startTime
        self.item = item
    }
}

extension Stoa {
    static public var placeholder: Stoa {
        Stoa(
            id: Identifier(),
            name: "placeholder",
            startTime: Date(),
            item: .placeholder
        )
    }
}

extension Stoa {
    public struct Create: Codable, Sendable, Equatable, Hashable {
        public let name: String
        public let startTime: Date
        
        public init(name: String, startTime: Date) {
            self.name = name
            self.startTime = startTime
        }
    }
}

extension Stoa {
    public struct Token: Codable, Sendable {
        public let id: UUID
        public let value: String
        
        public init(id: UUID, value: String) {
            self.id = id
            self.value = value
        }
    }
}

extension Stoa {
    public struct ForItem: Codable, Sendable, Hashable {
        public var id: Identifier<Stoa>
        public var name: String
        public var startTime: Date
        
        public init(id: Identifier<Stoa> = Identifier(), name: String, startTime: Date) {
            self.id = id
            self.name = name
            self.startTime = startTime
        }
    }
}
