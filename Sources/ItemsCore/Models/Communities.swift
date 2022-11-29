//
//  Communities.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Community: Codable, Identifiable, Equatable, Hashable {
    public var id: UUID
    public var communityName: String
    public var pictures: Pictures
    public var description: String
    public var membersCount: Int
    public var flairs: [String]
    public var rules: [String]
    public var createdOn: Date
    public var lastModifiedOn: Date
    public var mods: [User]
    public var topics: [Topic]
    public var restrictions: Restrictions
    public var isPrivate: Bool
    public var themeColor: ColorComponents
    
    public init(id: UUID, communityName: String, pictures: Pictures, description: String, membersCount: Int, flairs: [String], rules: [String], createdOn: Date, lastModifiedOn: Date, mods: [User], topics: [Topic], restrictions: Restrictions, isPrivate: Bool, themeColor: ColorComponents) {
        self.id = id
        self.communityName = communityName
        self.pictures = pictures
        self.description = description
        self.membersCount = membersCount
        self.flairs = flairs
        self.rules = rules
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
        self.mods = mods
        self.topics = topics
        self.restrictions = restrictions
        self.isPrivate = isPrivate
        self.themeColor = themeColor
    }
}

extension Community {
    public struct Pictures: Codable, Equatable, Hashable {
        public var displayPicture: String
        public var backgroundPicture: String
        public var transparentPicture: String

        public init(displayPicture: String, backgroundPicture: String, transparentPicture: String) {
            self.displayPicture = displayPicture
            self.backgroundPicture = backgroundPicture
            self.transparentPicture = transparentPicture
        }
    }
}

extension Community {
    public struct Restrictions: Codable, Equatable, Hashable {
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
    public struct Create: Codable {
        public var communityName: String
        public var pictures: Community.Pictures
        public var description: String
        public var flairs: [String]
        public var rules: [String]
        public var topicID: UUID
        public var restrictions: Community.Restrictions
        public var isPrivate: Bool
        public var themeColor: ColorComponents
        
        public init(communityName: String, pictures: Community.Pictures, description: String, flairs: [String], rules: [String], topicID: UUID, restrictions: Community.Restrictions, isPrivate: Bool, themeColor: ColorComponents) {
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
    public struct Private: Codable {
        public var id: UUID
        public var communityName: String
        public var displayPicture: String
        public var description: String
        public var membersCount: Int
        
        public init(id: UUID, communityName: String, displayPicture: String, description: String, membersCount: Int) {
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
        communityName: "placeholder",
        pictures: .placeholder,
        description: "placeholder Community",
        membersCount: 0,
        flairs: [],
        rules: [],
        createdOn: Date(),
        lastModifiedOn: Date(),
        mods: [],
        topics: [],
        restrictions: .placeholder,
        isPrivate: false,
        themeColor: ColorComponents(r: 1, g: 0, b: 0, o: 1)
    )
}

extension Community.Pictures {
    static public var placeholder: Community.Pictures = .init(
        displayPicture: "https://user-images.githubusercontent.com/30172987/159361950-c2666b9b-562c-4311-ab3c-151fc5bc3d0d.jpg",
        backgroundPicture: "https://user-images.githubusercontent.com/30172987/159362604-0342a7f1-8249-47da-9760-d547a3b7f212.jpg",
        transparentPicture: "https://user-images.githubusercontent.com/30172987/204453931-48d6177d-c3fe-43e4-a4b8-21917b2838e1.png"
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

public struct ColorComponents: Codable, Equatable, Hashable {
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
