//
//  Flairs.swift
//  ItemsCore
//
//  Created by Ian on 20/01/2023.
//

import Foundation

public struct Flair: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: UUID
    public var flairName: String
    public var isRestricted: Bool
    public var displayPicture: PictureContainer
    public var timeStamp: TimeStampContainer

    public init(id: UUID, flairName: String, isRestricted: Bool, displayPicture: PictureContainer, timeStamp: TimeStampContainer) {
        self.id = id
        self.flairName = flairName
        self.isRestricted = isRestricted
        self.displayPicture = displayPicture
        self.timeStamp = timeStamp
    }
}

extension Flair {
    public struct Create: Codable, Sendable {
        public var name: String
        public var displayPicture: PictureContainer

        public init(name: String, displayPicture: PictureContainer) {
            self.name = name
            self.displayPicture = displayPicture
        }
    }
}

extension Flair {
    public static var placeholder: Flair {
        Flair(id: UUID(), flairName: "Placeholder", isRestricted: true, displayPicture: .placeholder, timeStamp: .now)
    }
}
