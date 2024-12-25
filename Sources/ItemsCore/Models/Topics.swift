//
//  Topics.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Topic: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: Identifier<Self>
    public var name: String
    public var imageString: String
    public var imageColors: [ColorComponents]
    public var timeStamp: TimeStampContainer
    
    public init(
        id: Identifier<Self> = Identifier(),
        name: String,
        imageString: String,
        imageColors: [ColorComponents],
        timeStamp: TimeStampContainer
    ) {
        self.id = id
        self.name = name
        self.imageString = imageString
        self.imageColors = imageColors
        self.timeStamp = timeStamp
    }
}

extension Topic {
    public struct Create: Codable, Sendable {
        public var name: String
        public var imageString: String
        public var imageColors: [ColorComponents]
        
        public init(
            name: String,
            imageString: String,
            imageColors: [ColorComponents]
        ) {
            self.name = name
            self.imageString = imageString
            self.imageColors = imageColors
        }
    }
}
