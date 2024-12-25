//
//  File.swift
//  
//
//  Created by Ian on 26/11/2022.
//

import Foundation

/*
 Will be used for The Wall View
 The Content here should NEVER be NSFW
 It is available to anyone using the app
 and should therefore not be abused as advertisement

 all are within the last 48 hrs

 Stoa?
 Film?
 */

public struct Featured: Codable, Sendable {
    /// a community with the highest amount of members gained
    public var topGrowingCommunity: Community?

    /// the youngest community created as at that time
    public var newlyCreatedCommunty: Community?

    /// the most controverial Item
    public var controversialItem: Item?

    /// the item with the most votes upvotes-downvotes
    public var mostVotedItem: Item?

    /// the item with the most comments and replies
    public var mostCommentedItem: Item?

    public init(
        topGrowingCommunity: Community? = nil,
        newlyCreatedCommunty: Community? = nil,
        controversialItem: Item? = nil,
        mostVotedItem: Item? = nil,
        mostCommentedItem: Item? = nil
    ) {
        self.topGrowingCommunity = topGrowingCommunity
        self.newlyCreatedCommunty = newlyCreatedCommunty
        self.controversialItem = controversialItem
        self.mostVotedItem = mostVotedItem
        self.mostCommentedItem = mostCommentedItem
    }
}

extension Featured {
    public static let initial: Featured = Featured()
}
