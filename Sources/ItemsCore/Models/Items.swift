//
//  Items.swift
//  ItemsCore
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
    public var allowsComments: Bool
    public var allowsReplies: Bool
    public var commentsCount: Int
    public var previewPicture: PictureContainer
    public var stoa: Stoa.ForItem?
    public var timeStamp: TimeStampContainer
    
    public init(id: UUID, itemURL: String, creator: User, community: Community, description: String, upvotes: Int, downvotes: Int, filmURL: String? = nil, flair: String, crossPostParentItemID: UUID? = nil, allowsComments: Bool, allowsReplies: Bool, commentsCount: Int, previewPicture: PictureContainer, stoa: Stoa.ForItem? = nil, timeStamp: TimeStampContainer) {
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
        self.allowsComments = allowsComments
        self.allowsReplies = allowsReplies
        self.commentsCount = commentsCount
        self.previewPicture = previewPicture
        self.stoa = stoa
        self.timeStamp = timeStamp
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
        public var previewPicture: PictureContainer
        public var stoa: Stoa.Create?
        
        public init(itemURL: String, communityID: UUID, description: String, flair: String, filmURL: String? = nil, crossPostItemParentID: UUID? = nil, allowsComments: Bool, allowsReplies: Bool, previewPicture: PictureContainer, stoa: Stoa.Create? = nil) {
            self.itemURL = itemURL
            self.communityID = communityID
            self.description = description
            self.flair = flair
            self.filmURL = filmURL
            self.crossPostItemParentID = crossPostItemParentID
            self.allowsComments = allowsComments
            self.allowsReplies = allowsReplies
            self.previewPicture = previewPicture
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
            description: "Item Description",
            upvotes: Int.random(in: 0...10000),
            downvotes: Int.random(in: 0...10000),
            filmURL: "https://archive.org/download/vd_20210515_202105/vd.mp4",
            flair: "none",
            crossPostParentItemID: UUID(),
            allowsComments: true,
            allowsReplies: true,
            commentsCount: Int.random(in: 0...10000),
            previewPicture: .placeholder,
            stoa: .init(id: UUID(), name: "Join in to learn about", startTime: Date()),
            timeStamp: .now
        )
    }
}
