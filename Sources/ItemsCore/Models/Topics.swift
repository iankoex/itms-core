//
//  Topics.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Topic: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: Identifier<Self>
    public var topicName: String
    public var displayPicture: PictureContainer
    public var timeStamp: TimeStampContainer
    
    public init(id: Identifier<Self> = Identifier(), topicName: String, displayPicture: PictureContainer, timeStamp: TimeStampContainer) {
        self.id = id
        self.topicName = topicName
        self.displayPicture = displayPicture
        self.timeStamp = timeStamp
    }
}

extension Topic {
    public struct Create: Codable, Sendable {
        public var name: String
        public var displayPicture: PictureContainer
        
        public init(name: String, displayPicture: PictureContainer) {
            self.name = name
            self.displayPicture = displayPicture
        }
    }
}
