//
//  Communities.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation
//import SwiftUI

public struct Community: Codable, Identifiable, Equatable, Hashable {
    public var id: UUID
    public var communityName: String
    public var displayPicture: String
    public var backgroundPicture: String
//    public var transparentPicture: String
    public var description: String
    public var membersCount: Int
    public var flairs: [String]
    public var rules: [String]
    public var createdOn: Date
    public var lastModifiedOn: Date
    public var mods: [User]
    public var topics: [Topic]
    public var isPrivate: Bool
    public var allowsCrossPosts: Bool
    public var allowsCrossPostsOnly: Bool
    public var allowsFilms: Bool
    public var allowsStoa: Bool
    public var pointsAbove: Int
    public var themeColor: ColorComponents
    
    public init(id: UUID, communityName: String, displayPicture: String, backgroundPicture: String, description: String, membersCount: Int, flairs: [String], rules: [String], createdOn: Date, lastModifiedOn: Date, mods: [User], topics: [Topic], isPrivate: Bool, allowsCrossPosts: Bool, allowsCrossPostsOnly: Bool, allowsFilms: Bool, allowsStoa: Bool, pointsAbove: Int, themeColor: ColorComponents) {
        self.id = id
        self.communityName = communityName
        self.displayPicture = displayPicture
        self.backgroundPicture = backgroundPicture
        self.description = description
        self.membersCount = membersCount
        self.flairs = flairs
        self.rules = rules
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
        self.mods = mods
        self.topics = topics
        self.isPrivate = isPrivate
        self.allowsCrossPosts = allowsCrossPosts
        self.allowsCrossPostsOnly = allowsCrossPostsOnly
        self.allowsFilms = allowsFilms
        self.allowsStoa = allowsStoa
        self.pointsAbove = pointsAbove
        self.themeColor = themeColor
    }
}

extension Community {
    public struct Create: Codable {
        public var communityName: String
        public var displayPicture: String
        public var backgroundPicture: String
        public var description: String
        public var flairs: [String]
        public var rules: [String]
        public var topicID: UUID
        public var isPrivate: Bool
        public var allowsCrossPosts: Bool
        public var allowsCrossPostsOnly: Bool
        public var allowsFilms: Bool
        public var allowsStoa: Bool
        public var pointsAbove: Int
        public var themeColor: ColorComponents
        
        public init(communityName: String, displayPicture: String, backgroundPicture: String, description: String, flairs: [String], rules: [String], topicID: UUID, isPrivate: Bool, allowsCrossPosts: Bool, allowsCrossPostsOnly: Bool, allowsFilms: Bool, allowsStoa: Bool, pointsAbove: Int, themeColor: ColorComponents) {
            self.communityName = communityName
            self.displayPicture = displayPicture
            self.backgroundPicture = backgroundPicture
            self.description = description
            self.flairs = flairs
            self.rules = rules
            self.topicID = topicID
            self.isPrivate = isPrivate
            self.allowsCrossPosts = allowsCrossPosts
            self.allowsCrossPostsOnly = allowsCrossPostsOnly
            self.allowsFilms = allowsFilms
            self.allowsStoa = allowsStoa
            self.pointsAbove = pointsAbove
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
        displayPicture: "https://user-images.githubusercontent.com/30172987/159361950-c2666b9b-562c-4311-ab3c-151fc5bc3d0d.jpg",
        backgroundPicture: "https://user-images.githubusercontent.com/30172987/159362604-0342a7f1-8249-47da-9760-d547a3b7f212.jpg",
        description: "placeholder Community",
        membersCount: 0,
        flairs: [],
        rules: [],
        createdOn: Date(),
        lastModifiedOn: Date(),
        mods: [],
        topics: [],
        isPrivate: false,
        allowsCrossPosts: true,
        allowsCrossPostsOnly: false,
        allowsFilms: true,
        allowsStoa: true,
        pointsAbove: 0,
        themeColor: ColorComponents(r: 1, g: 0, b: 0, o: 1)
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
