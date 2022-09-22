//
//  Messages.swift
//  Items
//
//  Created by ian on 24/12/2021.
//

import Foundation

struct ChatMessage: Codable, Identifiable, Equatable, Hashable {
    var id: UUID
    var creator: User.UserX
    var communityID: UUID // UUID of the community
    var parentMessageID: UUID?
    var type: MessageType
    var text: String
    var sentTo: UUID?
    var reportedItem: UUID?
    var reportedComment: UUID?
    var createdOn: Date
    var lastModifiedOn: Date
    var replies: [ChatMessage]
    var draftText: String // the message being typed
}

extension ChatMessage {
    struct Create: Codable {
        var text: String
        var communityID: UUID
        var type: MessageType
        var parentMessageID: UUID?
        var afterDate: Date
        var sendTo: UUID?
        var itemID: UUID?
        var commentID: UUID?
        var page: Int
    }
}

extension ChatMessage {
    struct X: Codable {
        var id: UUID
        var creator: User.UserX
        var communityID: UUID // UUID of the community
        var parentMessageID: UUID?
        var type: MessageType
        var text: String
        var sentTo: UUID?
        var reportedItem: UUID?
        var reportedComment: UUID?
        var createdOn: Date
        var lastModifiedOn: Date
    }
}

enum MessageType: String, Codable {
    // used as notifications
    case normal
    // used when reporting
    case report
    // used when one is texting the mods from the polis view
    case modMail

    case reply
    // used when requesting for messages
    case requestingForMessages
    // used when requesting for some message
    case requestingSomeMessage
}

extension ChatMessage.X {
    func convertToChatMessage() -> ChatMessage {
        return ChatMessage(
            id: id,
            creator: creator,
            communityID: communityID,
            parentMessageID: parentMessageID,
            type: type,
            text: text,
            sentTo: sentTo,
            reportedItem: reportedItem,
            reportedComment: reportedComment,
            createdOn: createdOn,
            lastModifiedOn: lastModifiedOn,
            replies: [],
            draftText: ""
        )
    }
}

extension ChatMessage {
    static var placeholder: ChatMessage {
        ChatMessage(
            id: UUID(uuidString: "555FAE8C-7692-4639-A2EF-274ECF05EBBE")!,
            creator: User.UserX.placeholder,
            communityID: UUID(),
            type: .normal,
            text: "I am just a Placeholder. I am doing it out of my own will. :(",
            createdOn: Date(),
            lastModifiedOn: Date(),
            replies: [],
            draftText: ""
        )
    }
}

extension Collection where Element == ChatMessage.X {
    func convertToChatMessage() -> [ChatMessage] {
        return map { $0.convertToChatMessage() }
    }
}
