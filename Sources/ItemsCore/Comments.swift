//
//  Comments.swift
//  Items
//
//  Created by Ian on 21/07/2021.
//

import Foundation

struct Comment: Codable, Identifiable, Equatable {
    var id: UUID
    var text: String
    var creator: User
    var parentItemID: UUID
    var parentCommentID: UUID?
    var communityID: UUID
    var replies: [Comment]
    var upvotes: Int
    var downvotes: Int
    var level: Int
    var createdOn: Date
    var lastModifiedOn: Date
    var isFolded: Bool
}

extension Comment {
    struct POST: Codable {
        var text: String
        var creatorID: UUID
        var itemID: UUID
        var commentID: UUID?
        var level: Int
    }
}

extension Comment {
    // This struct is used when sorting
    struct GET: Codable, Identifiable {
        var id: UUID
        var text: String
        var creator: User
        var parentItemID: UUID
        var parentCommentID: UUID?
        var communityID: UUID
        var replies: [Comment.GET]
        var upvotes: Int
        var downvotes: Int
        var level: Int
        var createdOn: String
        var lastModifiedOn: String
    }
}

extension Comment.GET {
    func convertToComment() -> Comment {
        let crOn = DateUtils.getDate(createdOn)
        let lmOn = DateUtils.getDate(lastModifiedOn)
        return Comment(
            id: id,
            text: text,
            creator: creator,
            parentItemID: parentItemID,
            parentCommentID: parentCommentID,
            communityID: communityID,
            replies: replies.convertToComment(),
            upvotes: upvotes,
            downvotes: downvotes,
            level: level,
            createdOn: crOn,
            lastModifiedOn: lmOn,
            isFolded: false
        )
    }
}

extension Collection where Element == Comment.GET {
    func convertToComment() -> [Comment] {
        return map { $0.convertToComment() }
    }
}
