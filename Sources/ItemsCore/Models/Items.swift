//
//  Items.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
// 

import Foundation

public struct Item: Identifiable, Codable, Sendable, Equatable, Hashable {
    public var id: UUID
    public var itemURL: String
    public var creator: User
    public var community: Community
    public var description: String
    public var upvotes: Int
    public var downvotes: Int
    public var film: Film?
    public var flair: Flair
    public var crossPostParentItemID: UUID?
    public var allowsComments: Bool
    public var allowsReplies: Bool
    public var commentsCount: Int
    public var previewPicture: PictureContainer
    public var type: ItemType
    public var stoa: Stoa.ForItem?
    public var timeStamp: TimeStampContainer
    
    public init(id: UUID, itemURL: String, creator: User, community: Community, description: String, upvotes: Int, downvotes: Int, film: Film? = nil, flair: Flair, crossPostParentItemID: UUID? = nil, allowsComments: Bool, allowsReplies: Bool, commentsCount: Int, type: ItemType, previewPicture: PictureContainer, stoa: Stoa.ForItem? = nil, timeStamp: TimeStampContainer) {
        self.id = id
        self.itemURL = itemURL
        self.creator = creator
        self.community = community
        self.description = description
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.film = film
        self.flair = flair
        self.crossPostParentItemID = crossPostParentItemID
        self.allowsComments = allowsComments
        self.allowsReplies = allowsReplies
        self.commentsCount = commentsCount
        self.type = type
        self.previewPicture = previewPicture
        self.stoa = stoa
        self.timeStamp = timeStamp
    }
}

extension Item {
    public struct Create: Codable, Sendable, Equatable {
        public var itemURL: String
        public var communityID: UUID
        public var description: String
        public var flair: Flair
        public var film: Film?
        public var crossPostItemParentID: UUID?
        public var allowsComments: Bool
        public var allowsReplies: Bool
        public var type: Item.ItemType
        public var previewPicture: PictureContainer
        public var stoa: Stoa.Create?
        
        public init(itemURL: String, communityID: UUID, description: String, flair: Flair, film: Film? = nil, crossPostItemParentID: UUID? = nil, allowsComments: Bool, allowsReplies: Bool, type: ItemType, previewPicture: PictureContainer, stoa: Stoa.Create? = nil) {
            self.itemURL = itemURL
            self.communityID = communityID
            self.description = description
            self.flair = flair
            self.film = film
            self.crossPostItemParentID = crossPostItemParentID
            self.allowsComments = allowsComments
            self.allowsReplies = allowsReplies
            self.type = type
            self.previewPicture = previewPicture
            self.stoa = stoa
        }
    }
}

extension Item {
    public enum ItemType: String, Codable, Sendable, Equatable {
        case video
        case audio
    }
}

extension Item {
    public static var placeholder: Item {
        Item(
            id: UUID(),
            itemURL: "https://archive.org/download/vd_20210515_202105/vd.mp4",
            creator: .placeholder,
            community: .placeholder,
            description: "Item Description",
            upvotes: Int.random(in: 0...10000),
            downvotes: Int.random(in: 0...10000),
            film: .placeholder,
            flair: .placeholder,
            crossPostParentItemID: UUID(),
            allowsComments: true,
            allowsReplies: true,
            commentsCount: Int.random(in: 0...10000),
            type: .video,
            previewPicture: .placeholder,
            stoa: .init(id: UUID(), name: "Join in to learn about", startTime: Date()),
            timeStamp: .now
        )
    }
}
