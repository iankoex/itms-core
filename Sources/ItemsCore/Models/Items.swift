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
    public var createdOn: String
    public var lastModifiedOn: String
    public var allowsComments: Bool
    public var allowsReplies: Bool
    public var commentsCount: Int
    public var stoa: Stoa.ForItem?
    
    public init(id: UUID, itemURL: String, creator: User, community: Community, description: String, upvotes: Int, downvotes: Int, filmURL: String? = nil, flair: String, crossPostParentItemID: UUID? = nil, createdOn: String, lastModifiedOn: String, allowsComments: Bool, allowsReplies: Bool, commentsCount: Int, stoa: Stoa.ForItem? = nil) {
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

// public struct CrossPostItem: Codable {
//    public var id: UUID?
//    public var itemUrl: String
//    public var creator: CrossPostCreator
//    public var community: CrossPostCommunity
//    public var description: String
//    public var upvotes: Int
//    public var downvotes: Int
//    public var filmUrl: String?
//    public var flair: String
//    public var crossPostParentItem: CrossPostID?
//    public var createdOn: String
//    public var lastModifiedOn: String
//    public var allowsComments: Bool
//    public var allowsReplies: Bool
//    public var commentsCount: Int
// }
//
// public struct CrossPostID: Codable {
//    public var id: UUID
// }
//
// public struct CrossPostCreator: Codable {
//    public var id: UUID
// }
//
// public struct CrossPostCommunity: Codable {
//    public var id: UUID
// }

extension Item {
    public struct POST: Codable {
        public var itemURL: String
        public var communityID: UUID
        public var description: String
        public var flair: String
        public var filmUrl: String?
        public var crossPostItemParentID: UUID?
        public var allowsComments: Bool
        public var allowsReplies: Bool
        public var stoa: Stoa.POST?
        
        public init(itemURL: String, communityID: UUID, description: String, flair: String, filmUrl: String? = nil, crossPostItemParentID: UUID? = nil, allowsComments: Bool, allowsReplies: Bool, stoa: Stoa.POST? = nil) {
            self.itemURL = itemURL
            self.communityID = communityID
            self.description = description
            self.flair = flair
            self.filmUrl = filmUrl
            self.crossPostItemParentID = crossPostItemParentID
            self.allowsComments = allowsComments
            self.allowsReplies = allowsReplies
            self.stoa = stoa
        }
    }
}
