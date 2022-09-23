//
//  Items.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct Item: Identifiable, Codable, Equatable, Hashable {
    public var id: UUID
    public var itemURL: String
    public var creator: User
    public var community: Community
    public var description: String
    public var upvotes: Int
    public var downvotes: Int
    public var filmURL: String?
    public var flair: String
    public var crossPostParentItemID: UUID?
    public var createdOn: Date
    public var lastModifiedOn: Date
    public var allowsComments: Bool
    public var allowsReplies: Bool
    public var commentsCount: Int
    public var stoa: Stoa.ForItem?
    
    public init(id: UUID, itemURL: String, creator: User, community: Community, description: String, upvotes: Int, downvotes: Int, filmURL: String? = nil, flair: String, crossPostParentItemID: UUID? = nil, createdOn: Date, lastModifiedOn: Date, allowsComments: Bool, allowsReplies: Bool, commentsCount: Int, stoa: Stoa.ForItem? = nil) {
        self.id = id
        self.itemURL = itemURL
        self.creator = creator
        self.community = community
        self.description = description
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.filmURL = filmURL
        self.flair = flair
        self.crossPostParentItemID = crossPostParentItemID
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
        self.allowsComments = allowsComments
        self.allowsReplies = allowsReplies
        self.commentsCount = commentsCount
        self.stoa = stoa
    }
}

extension Item {
    public struct Create: Codable {
        public var itemURL: String
        public var communityID: UUID
        public var description: String
        public var flair: String
        public var filmURL: String?
        public var crossPostItemParentID: UUID?
        public var allowsComments: Bool
        public var allowsReplies: Bool
        public var stoa: Stoa.Create?
        
        public init(itemURL: String, communityID: UUID, description: String, flair: String, filmURL: String? = nil, crossPostItemParentID: UUID? = nil, allowsComments: Bool, allowsReplies: Bool, stoa: Stoa.Create? = nil) {
            self.itemURL = itemURL
            self.communityID = communityID
            self.description = description
            self.flair = flair
            self.filmURL = filmURL
            self.crossPostItemParentID = crossPostItemParentID
            self.allowsComments = allowsComments
            self.allowsReplies = allowsReplies
            self.stoa = stoa
        }
    }
}

extension Item {
    public static var placeholder: Item {
        Item(
            id: UUID(),
            itemURL: "https://archive.org/download/vd_20210515_202105/vd.mp4",
            creator: .placeholder,
            community: .placeholder,
            description: "Desc",
            upvotes: 0,
            downvotes: 0,
            flair: "none",
            createdOn: Date(),
            lastModifiedOn: Date(),
            allowsComments: true,
            allowsReplies: true,
            commentsCount: 0
        )
    }
}
