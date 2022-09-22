//
//  Items.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation

struct Item: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    var itemURL: String
    var creator: User
    var community: Community
    var description: String
    var upvotes: Int
    var downvotes: Int
    var filmURL: String?
    var flair: String
    var crossPostParentItemID: UUID?
    var createdOn: String
    var lastModifiedOn: String
    var allowsComments: Bool
    var allowsReplies: Bool
    var commentsCount: Int
    var stoa: Stoa.ForItem?
}

// struct CrossPostItem: Codable {
//    var id: UUID?
//    var itemUrl: String
//    var creator: CrossPostCreator
//    var community: CrossPostCommunity
//    var description: String
//    var upvotes: Int
//    var downvotes: Int
//    var filmUrl: String?
//    var flair: String
//    var crossPostParentItem: CrossPostID?
//    var createdOn: String
//    var lastModifiedOn: String
//    var allowsComments: Bool
//    var allowsReplies: Bool
//    var commentsCount: Int
// }
//
// struct CrossPostID: Codable {
//    var id: UUID
// }
//
// struct CrossPostCreator: Codable {
//    var id: UUID
// }
//
// struct CrossPostCommunity: Codable {
//    var id: UUID
// }

extension Item {
    struct POST: Codable {
        var itemURL: String
        var communityID: UUID
        var description: String
        var flair: String
        var filmUrl: String?
        var crossPostItemParentID: UUID?
        var allowsComments: Bool
        var allowsReplies: Bool
        var stoa: Stoa.POST?
    }
}
