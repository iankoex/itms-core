//
//  Communities.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Community: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: UUID
    public var communityName: String
    public var pictures: Pictures
    public var description: String
    public var membersCount: Int
    public var flairs: [Flair]
    public var rules: [String]
    public var mods: [User]
    public var topics: [Topic]
    public var restrictions: Restrictions
    public var isPrivate: Bool
    public var themeColor: ColorComponents
    public var timeStamp: TimeStampContainer
    
    public init(id: UUID, communityName: String, pictures: Pictures, description: String, membersCount: Int, flairs: [Flair], rules: [String], mods: [User], topics: [Topic], restrictions: Restrictions, isPrivate: Bool, themeColor: ColorComponents, timeStamp: TimeStampContainer) {
        self.id = id
        self.communityName = communityName
        self.pictures = pictures
        self.description = description
        self.membersCount = membersCount
        self.flairs = flairs
        self.rules = rules
        self.mods = mods
        self.topics = topics
        self.restrictions = restrictions
        self.isPrivate = isPrivate
        self.themeColor = themeColor
        self.timeStamp = timeStamp
    }
}

extension Community {
    public struct Pictures: Codable, Sendable, Equatable, Hashable {
        public var displayPicture: PictureContainer
        public var backgroundPicture: PictureContainer
        public var transparentPicture: PictureContainer

        public init(displayPicture: PictureContainer, backgroundPicture: PictureContainer, transparentPicture: PictureContainer) {
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

        public init(allowsCrossPosts: Bool, allowsCrossPostsOnly: Bool, allowsFilms: Bool, allowsStoa: Bool, pointsAbove: Int) {
            self.allowsCrossPosts = allowsCrossPosts
            self.allowsCrossPostsOnly = allowsCrossPostsOnly
            self.allowsFilms = allowsFilms
            self.allowsStoa = allowsStoa
            self.pointsAbove = pointsAbove
        }
    }
}

extension Community {
    public struct Create: Codable, Sendable {
        public var communityName: String
        public var pictures: Community.Pictures
        public var description: String
        public var flairs: [Flair.Create]
        public var rules: [String]
        public var topicID: UUID
        public var restrictions: Community.Restrictions
        public var isPrivate: Bool
        public var themeColor: ColorComponents
        
        public init(communityName: String, pictures: Community.Pictures, description: String, flairs: [Flair.Create], rules: [String], topicID: UUID, restrictions: Community.Restrictions, isPrivate: Bool, themeColor: ColorComponents) {
            self.communityName = communityName
            self.pictures = pictures
            self.description = description
            self.flairs = flairs
            self.rules = rules
            self.topicID = topicID
            self.restrictions = restrictions
            self.isPrivate = isPrivate
            self.themeColor = themeColor
        }
    }
}

extension Community {
    // For the Invite View
    public struct Private: Codable, Sendable {
        public var id: UUID
        public var communityName: String
        public var displayPicture: PictureContainer
        public var description: String
        public var membersCount: Int
        
        public init(id: UUID, communityName: String, displayPicture: PictureContainer, description: String, membersCount: Int) {
            self.id = id
            self.communityName = communityName
            self.displayPicture = displayPicture
            self.description = description
            self.membersCount = membersCount
        }
    }
}

extension Community {
    static public var placeholder: Community = Community(
        id: UUID(),
        communityName: "Placeholder",
        pictures: .placeholder,
        description: "This is a Placeholder Community",
        membersCount: 0,
        flairs: [],
        rules: ["Mod Mail Rule"],
        mods: [],
        topics: [],
        restrictions: .placeholder,
        isPrivate: false,
        themeColor: ColorComponents(r: 1, g: 0, b: 0, o: 1),
        timeStamp: .now
    )
}

extension Community.Pictures {
    static public var placeholder: Community.Pictures = .init(
        displayPicture: .placeholder,
        backgroundPicture: .placeholder,
        transparentPicture: .placeholder
    )
}

extension Community.Restrictions {
    static public var placeholder: Community.Restrictions = .init(
        allowsCrossPosts: true,
        allowsCrossPostsOnly: false,
        allowsFilms: true,
        allowsStoa: true,
        pointsAbove: 0
    )
}

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
