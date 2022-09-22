//
//  Communities.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation
import SwiftUI

struct Community: Codable, Identifiable {
    var id: UUID
    var communityName: String
    var displayPicture: String
    var backgroundPicture: String
//    var transparentPicture: String
    var description: String
    var membersCount: Int
    var flairs: [String]
    var rules: [String]
    var createdOn: String
    var lastModifiedOn: String
    var mods: [User]
    var topics: [Topic]
    var isPrivate: Bool
    var allowsCrossPosts: Bool
    var allowsCrossPostsOnly: Bool
    var allowsFilms: Bool
    var allowsStoa: Bool
    var pointsAbove: Int
    var themeColor: ColorComponents
}

extension Community: Equatable {
    static func == (lhs: Community, rhs: Community) -> Bool {
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
    func hash(into hasher: inout Hasher) {
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
    struct POST: Codable {
        var communityName: String
        var displayPicture: String
        var backgroundPicture: String
        var description: String
        var flairs: [String]
        var rules: [String]
        var topicID: UUID
        var isPrivate: Bool
        var allowsCrossPosts: Bool
        var allowsCrossPostsOnly: Bool
        var allowsFilms: Bool
        var allowsStoa: Bool
        var pointsAbove: Int
        var themeColor: ColorComponents
    }
}

extension Community {
    // For the Invite View
    struct Private: Codable {
        var id: UUID
        var communityName: String
        var displayPicture: String
        var description: String
        var membersCount: Int
    }
}

extension Community {
    struct CommunityX: Codable, Identifiable {
        var id: UUID
        var communityName: String
        var displayPicture: String
        var backgroundPicture: String
        var description: String
        var membersCount: Int
        var flairs: [String]
        var rules: [String]
        var createdOn: Date
        var lastModifiedOn: Date
        var mods: [User.UserX]
        var topics: [Topic.TopicX]
        var isPrivate: Bool
        var allowsCrossPosts: Bool
        var allowsCrossPostsOnly: Bool
        var allowsFilms: Bool
        var allowsStoa: Bool
        var pointsAbove: Int
        var themeColor: ColorComponents
    }
}

extension Community.CommunityX {
    func convertToCommunity() -> Community {
        let crOn = DateUtils.getString(date: createdOn)
        let lmOn = DateUtils.getString(date: lastModifiedOn)
        let actualMods = mods.convertToUser()
        let actualTopics = topics.convertToTopic()
        return Community(
            id: id,
            communityName: communityName,
            displayPicture: displayPicture,
            backgroundPicture: backgroundPicture,
            description: description,
            membersCount: membersCount,
            flairs: flairs,
            rules: rules,
            createdOn: crOn,
            lastModifiedOn: lmOn,
            mods: actualMods,
            topics: actualTopics,
            isPrivate: isPrivate,
            allowsCrossPosts: allowsCrossPosts,
            allowsCrossPostsOnly: allowsCrossPostsOnly,
            allowsFilms: allowsFilms,
            allowsStoa: allowsStoa,
            pointsAbove: pointsAbove,
            themeColor: themeColor
        )
    }
}

extension Community {
    static var placeholder: Community = Community(
        id: UUID(),
        communityName: "placeholder",
        displayPicture: "",
        backgroundPicture: "",
        description: "",
        membersCount: 0,
        flairs: [],
        rules: [],
        createdOn: "",
        lastModifiedOn: "",
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

extension Collection where Element == Community.CommunityX {
    func convertToCommunity() -> [Community] {
        return self.map { $0.convertToCommunity() }
    }
}

struct ColorComponents: Codable, Equatable, Hashable {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var o: CGFloat
}

extension ColorComponents {
    func color() -> Color {
        Color(red: r, green: g, blue: b, opacity: o)
    }
}

extension Color {
    func components() -> ColorComponents {
        #if os(iOS)
        let comp = UIColor(self).cgColor.components
        #else
        let comp = NSColor(self).cgColor.components
        #endif
        guard let comp = comp else {
            return ColorComponents(r: 0.0, g: 0.4784314036369324, b: 0.9999999403953552, o: 1.0) // This is Color.accentColor
        }
        return  ColorComponents(r: comp[0], g: comp[1], b: comp[2], o: comp[3])
    }
}
