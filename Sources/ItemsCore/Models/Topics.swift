//
//  Topics.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Topic: Codable, Identifiable {
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
    public struct TopicX: Codable, Identifiable {
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
}

extension Topic.TopicX {
    public func convertToTopic() -> Topic {
        return Topic(id: id, topicName: topicName, createdOn: createdOn, lastModifiedOn: lastModifiedOn)
    }
}

extension Collection where Element == Topic.TopicX {
    public func convertToTopic() -> [Topic] {
        return map { $0.convertToTopic() }
    }
}
