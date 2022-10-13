//
//  Topics.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Topic: Codable, Identifiable, Equatable, Hashable {
    public var id: UUID
    public var topicName: String
    public var createdOn: Date
    public var lastModifiedOn: Date
    
    public init(id: UUID, topicName: String, createdOn: Date, lastModifiedOn: Date) {
        self.id = id
        self.topicName = topicName
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
    }
}

extension Topic {
    public struct Create: Codable {
        public var name: String
        
        public init(name: String) {
            self.name = name
        }
    }
}
