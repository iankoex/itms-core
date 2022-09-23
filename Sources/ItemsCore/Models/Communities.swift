//
//  Communities.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation
//import SwiftUI

public struct Community: Codable, Identifiable {
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

extension Community: Equatable {
    public static func == (lhs: Community, rhs: Community) -> Bool {
        lhs.id == rhs.id &&
        lhs.communityName == rhs.communityName &&
        lhs.displayPicture == rhs.displayPicture &&
        lhs.backgroundPicture == rhs.backgroundPicture &&
        lhs.description == rhs.description &&
        lhs.membersCount == rhs.membersCount &&
        lhs.flairs == rhs.flairs &&
        lhs.rules == rhs.rules &&
        lhs.isPrivate == rhs.isPrivate &&
        lhs.allowsCrossPosts == rhs.allowsCrossPosts &&
        lhs.allowsCrossPostsOnly == rhs.allowsCrossPostsOnly &&
        lhs.allowsFilms == rhs.allowsFilms &&
        lhs.allowsStoa == rhs.allowsStoa &&
        lhs.pointsAbove == rhs.pointsAbove &&
        lhs.themeColor == rhs.themeColor
    }
}

extension Community: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(communityName)
        hasher.combine(displayPicture)
        hasher.combine(backgroundPicture)
        hasher.combine(description)
        hasher.combine(membersCount)
        hasher.combine(flairs)
        hasher.combine(rules)
        hasher.combine(isPrivate)
        hasher.combine(allowsCrossPosts)
        hasher.combine(allowsCrossPostsOnly)
        hasher.combine(allowsFilms)
        hasher.combine(allowsStoa)
        hasher.combine(pointsAbove)
        hasher.combine(themeColor)
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

//extension Community {
//    public struct CommunityX: Codable, Identifiable {
//        public var id: UUID
//        public var communityName: String
//        public var displayPicture: String
//        public var backgroundPicture: String
//        public var description: String
//        public var membersCount: Int
//        public var flairs: [String]
//        public var rules: [String]
//        public var createdOn: Date
//        public var lastModifiedOn: Date
//        public var mods: [User.UserX]
//        public var topics: [Topic.TopicX]
//        public var isPrivate: Bool
//        public var allowsCrossPosts: Bool
//        public var allowsCrossPostsOnly: Bool
//        public var allowsFilms: Bool
//        public var allowsStoa: Bool
//        public var pointsAbove: Int
//        public var themeColor: ColorComponents
//
//        public init(id: UUID, communityName: String, displayPicture: String, backgroundPicture: String, description: String, membersCount: Int, flairs: [String], rules: [String], createdOn: Date, lastModifiedOn: Date, mods: [User.UserX], topics: [Topic.TopicX], isPrivate: Bool, allowsCrossPosts: Bool, allowsCrossPostsOnly: Bool, allowsFilms: Bool, allowsStoa: Bool, pointsAbove: Int, themeColor: ColorComponents) {
//            self.id = id
//            self.communityName = communityName
//            self.displayPicture = displayPicture
//            self.backgroundPicture = backgroundPicture
//            self.description = description
//            self.membersCount = membersCount
//            self.flairs = flairs
//            self.rules = rules
//            self.createdOn = createdOn
//            self.lastModifiedOn = lastModifiedOn
//            self.mods = mods
//            self.topics = topics
//            self.isPrivate = isPrivate
//            self.allowsCrossPosts = allowsCrossPosts
//            self.allowsCrossPostsOnly = allowsCrossPostsOnly
//            self.allowsFilms = allowsFilms
//            self.allowsStoa = allowsStoa
//            self.pointsAbove = pointsAbove
//            self.themeColor = themeColor
//        }
//    }
//}
//
//extension Community.CommunityX {
//    public func convertToCommunity() -> Community {
//        let crOn = DateUtils.getString(date: createdOn)
//        let lmOn = DateUtils.getString(date: lastModifiedOn)
//        let actualMods = mods.convertToUser()
//        let actualTopics = topics.convertToTopic()
//        return Community(
//            id: id,
//            communityName: communityName,
//            displayPicture: displayPicture,
//            backgroundPicture: backgroundPicture,
//            description: description,
//            membersCount: membersCount,
//            flairs: flairs,
//            rules: rules,
//            createdOn: createdOn,
//            lastModifiedOn: createdOn,
//            mods: actualMods,
//            topics: actualTopics,
//            isPrivate: isPrivate,
//            allowsCrossPosts: allowsCrossPosts,
//            allowsCrossPostsOnly: allowsCrossPostsOnly,
//            allowsFilms: allowsFilms,
//            allowsStoa: allowsStoa,
//            pointsAbove: pointsAbove,
//            themeColor: themeColor
//        )
//    }
//}

extension Community {
    static public var placeholder: Community = Community(
        id: UUID(),
        communityName: "placeholder",
        displayPicture: "",
        backgroundPicture: "",
        description: "",
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

//extension Collection where Element == Community.CommunityX {
//    public func convertToCommunity() -> [Community] {
//        return self.map { $0.convertToCommunity() }
//    }
//}

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
