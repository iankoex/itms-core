//
//  Flairs.swift
//  ItemsCore
//
//  Created by Ian on 20/01/2023.
//

import Foundation

public struct Flair: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: Identifier<Self>
    public var name: String
    public var isRestricted: Bool
    public var displayPicture: PictureContainer
    public var timeStamp: TimeStampContainer

    public init(
        id: Identifier<Self> = Identifier(),
        name: String,
        isRestricted: Bool,
        displayPicture: PictureContainer,
        timeStamp: TimeStampContainer
    ) {
        self.id = id
        self.name = name
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
        Flair(
            id: Identifier<Flair>(),
            name: "Fix Flair Join in to learn about Join in to learn about Join in to learn aboutr",
            isRestricted: true,
            displayPicture: .placeholder,
            timeStamp: .now
        )
    }
    
    public static var staticPlaceholder: Flair {
        Flair(
            id: Identifier<Flair>("70DD384B-AFB5-449D-8C58-9743B24DB703"),
            name: "Fix Flair Join in to learn about Join in to learn about Join in to learn aboutr",
            isRestricted: true,
            displayPicture: .staticPlaceholder,
            timeStamp: .now
        )
    }
}
