//
//  Comments.swift
//  ItemsCore
//
//  Created by Ian on 21/07/2021.
//

import Foundation

public struct Comment: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: Identifier<Self>
    public var text: String
    public var creator: User
    public var parentItemID: Identifier<Item>
    public var parentCommentID: Identifier<Comment>?
    public var communityID: Identifier<Community>
    public var replies: [Comment]
    public var upvotes: Int
    public var downvotes: Int
    public var level: Int
    public var isFolded: Bool
    public var hasReplies: Bool
    public var repliesCount: Int
    public var timeStamp: TimeStampContainer
    
    public init(
        id: Identifier<Self> = Identifier(),
        text: String,
        creator: User,
        parentItemID: Identifier<Item>,
        parentCommentID: Identifier<Comment>? = nil,
        communityID: Identifier<Community>,
        replies: [Comment],
        upvotes: Int,
        downvotes: Int,
        level: Int,
        isFolded: Bool,
        hasReplies: Bool,
        repliesCount: Int,
        timeStamp: TimeStampContainer
    ) {
        self.id = id
        self.text = text
        self.creator = creator
        self.parentItemID = parentItemID
        self.parentCommentID = parentCommentID
        self.communityID = communityID
        self.replies = replies
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.level = level
        self.isFolded = isFolded
        self.hasReplies = hasReplies
        self.repliesCount = repliesCount
        self.timeStamp = timeStamp
    }
}

extension Comment {
    public struct Create: Codable, Sendable {
        public var text: String
        public var creatorID: Identifier<User>
        public var itemID: Identifier<Item>
        public var commentID: Identifier<Comment>?
        public var level: Int
        
        public init(
            text: String,
            creatorID: Identifier<User>,
            itemID: Identifier<Item>,
            commentID: Identifier<Comment>? = nil,
            level: Int
        ) {
            self.text = text
            self.creatorID = creatorID
            self.itemID = itemID
            self.commentID = commentID
            self.level = level
        }
    }
}

extension Comment {
    public static var placeholder: Comment {
        Comment(
            id: Identifier<Comment>("C5229903-1ECE-417F-A396-B0255A517AD3"),
            text: "Placeholder",
            creator: .placeholder,
            parentItemID: Identifier<Item>(),
            parentCommentID: Identifier<Comment>(),
            communityID: Identifier<Community>(),
            replies: [],
            upvotes: 0,
            downvotes: 0,
            level: 0,
            isFolded: true,
            hasReplies: false,
            repliesCount: 0,
            timeStamp: .now
        )
    }
}
