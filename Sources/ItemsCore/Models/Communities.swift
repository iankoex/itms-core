//
//  Communities.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Community: Codable, Sendable, Identifiable, Equatable, Hashable, Nameable {
    public var id: Identifier<Self>
    public var name: String
    public var pictures: Pictures
    public var description: String
    public var membersCount: Int
    public var flairs: [Flair]
    public var policies: [Policy]
    public var mods: [User]
    public var topics: [Topic]
    public var restrictions: Restrictions
    public var type: CommunityType
    public var themeColor: ColorComponents
    public var timeStamp: TimeStampContainer
    
    public init(
        id: Identifier<Self> = Identifier(),
        name: String,
        pictures: Pictures,
        description: String,
        membersCount: Int,
        flairs: [Flair],
        policies: [Policy],
        mods: [User],
        topics: [Topic],
        restrictions: Restrictions,
        type: CommunityType,
        themeColor: ColorComponents,
        timeStamp: TimeStampContainer
    ) {
        self.id = id
        self.name = name
        self.pictures = pictures
        self.description = description
        self.membersCount = membersCount
        self.flairs = flairs
        self.policies = policies
        self.mods = mods
        self.topics = topics
        self.restrictions = restrictions
        self.type = type
        self.themeColor = themeColor
        self.timeStamp = timeStamp
    }
}

extension Community {
    public struct Pictures: Codable, Sendable, Equatable, Hashable {
        public var displayPicture: PictureContainer
        public var backgroundPicture: PictureContainer
        public var transparentPicture: PictureContainer

        public init(
            displayPicture: PictureContainer,
            backgroundPicture: PictureContainer,
            transparentPicture: PictureContainer
        ) {
            self.displayPicture = displayPicture
            self.backgroundPicture = backgroundPicture
            self.transparentPicture = transparentPicture
        }
    }
}

extension Community {
    public struct Restrictions: Codable, Sendable, Equatable, Hashable {
        public var allowsCrossPosts: Bool
        public var allowsCrossPostsOnly: Bool
        public var allowsFilms: Bool
        public var allowsStoa: Bool
        public var pointsAbove: Int
        public var contentRating: ContentRating

        public init(
            allowsCrossPosts: Bool,
            allowsCrossPostsOnly: Bool,
            allowsFilms: Bool,
            allowsStoa: Bool,
            pointsAbove: Int,
            contentRating: ContentRating
        ) {
            self.allowsCrossPosts = allowsCrossPosts
            self.allowsCrossPostsOnly = allowsCrossPostsOnly
            self.allowsFilms = allowsFilms
            self.allowsStoa = allowsStoa
            self.pointsAbove = pointsAbove
            self.contentRating = contentRating
        }
    }
}

extension Community {
    public enum CommunityType: String, Codable, Sendable, Hashable {
        case publicCommunity
        case privateCommunity
        case restrictedCommunity
    }
}

extension Community {
    public struct Policy: Identifiable, Codable, Equatable, Sendable, Hashable {
        public var id: Identifier<Self> = Identifier()
        public var title: String
        public var detail: String
        
        public init(title: String, detail: String) {
            self.title = title
            self.detail = detail
        }
    }

}

extension Community {
    public struct Create: Codable, Sendable {
        public var name: String
        public var pictures: Community.Pictures
        public var description: String
        public var flairs: [Flair.Create]
        public var policies: [Community.Policy]
        public var restrictions: Community.Restrictions
        public var type: CommunityType
        public var themeColor: ColorComponents
        
        public init(
            name: String,
            pictures: Community.Pictures,
            description: String,
            flairs: [Flair.Create],
            policies: [Community.Policy],
            restrictions: Community.Restrictions,
            type: CommunityType,
            themeColor: ColorComponents
        ) {
            self.name = name
            self.pictures = pictures
            self.description = description
            self.flairs = flairs
            self.policies = policies
            self.restrictions = restrictions
            self.type = type
            self.themeColor = themeColor
        }
    }
}

extension Community {
    // For the Invite View
    public struct Private: Codable, Sendable {
        public var id: Identifier<Community>
        public var name: String
        public var displayPicture: PictureContainer
        public var description: String
        public var membersCount: Int
        
        public init(
            id: Identifier<Community> = Identifier(),
            name: String,
            displayPicture: PictureContainer,
            description: String,
            membersCount: Int
        ) {
            self.id = id
            self.name = name
            self.displayPicture = displayPicture
            self.description = description
            self.membersCount = membersCount
        }
    }
}

extension Community {
    static public let placeholder: Community = Community(
        id: Identifier(),
        name: "Placeholder",
        pictures: .placeholder,
        description: "This is a Placeholder Community",
        membersCount: 0,
        flairs: [],
        policies: [],
        mods: [],
        topics: [],
        restrictions: .placeholder,
        type: .publicCommunity,
        themeColor: ColorComponents(r: 1, g: 0, b: 0, o: 1),
        timeStamp: .now
    )
}

extension Community.Pictures {
    static public let placeholder: Community.Pictures = .init(
        displayPicture: .placeholder,
        backgroundPicture: .placeholder,
        transparentPicture: .placeholder
    )
}

extension Community.Restrictions {
    static public let placeholder: Community.Restrictions = .init(
        allowsCrossPosts: true,
        allowsCrossPostsOnly: false,
        allowsFilms: true,
        allowsStoa: true,
        pointsAbove: 0,
        contentRating: .sfw
    )
}
