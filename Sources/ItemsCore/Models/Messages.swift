//
//  Messages.swift
//  Items
//
//  Created by Ian on 24/12/2021.
//

import Foundation

public struct ChatMessage: Codable, Identifiable, Equatable, Hashable {
    public var id: UUID
    public var creator: User.UserX
    public var communityID: UUID // UUID of the community
    public var parentMessageID: UUID?
    public var type: MessageType
    public var text: String
    public var sentTo: UUID?
    public var reportedItem: UUID?
    public var reportedComment: UUID?
    public var createdOn: Date
    public var lastModifiedOn: Date
    public var replies: [ChatMessage]
    public var draftText: String // the message being typed
    
    public init(id: UUID, creator: User.UserX, communityID: UUID, parentMessageID: UUID? = nil, type: MessageType, text: String, sentTo: UUID? = nil, reportedItem: UUID? = nil, reportedComment: UUID? = nil, createdOn: Date, lastModifiedOn: Date, replies: [ChatMessage], draftText: String) {
        self.id = id
        self.creator = creator
        self.communityID = communityID
        self.parentMessageID = parentMessageID
        self.type = type
        self.text = text
        self.sentTo = sentTo
        self.reportedItem = reportedItem
        self.reportedComment = reportedComment
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
        self.replies = replies
        self.draftText = draftText
    }
}

extension ChatMessage {
    public struct Create: Codable {
        public var text: String
        public var communityID: UUID
        public var type: MessageType
        public var parentMessageID: UUID?
        public var afterDate: Date
        public var sendTo: UUID?
        public var itemID: UUID?
        public var commentID: UUID?
        public var page: Int
        
        public init(text: String, communityID: UUID, type: MessageType, parentMessageID: UUID? = nil, afterDate: Date, sendTo: UUID? = nil, itemID: UUID? = nil, commentID: UUID? = nil, page: Int) {
            self.text = text
            self.communityID = communityID
            self.type = type
            self.parentMessageID = parentMessageID
            self.afterDate = afterDate
            self.sendTo = sendTo
            self.itemID = itemID
            self.commentID = commentID
            self.page = page
        }
    }
}

extension ChatMessage {
    public struct X: Codable {
        public var id: UUID
        public var creator: User.UserX
        public var communityID: UUID // UUID of the community
        public var parentMessageID: UUID?
        public var type: MessageType
        public var text: String
        public var sentTo: UUID?
        public var reportedItem: UUID?
        public var reportedComment: UUID?
        public var createdOn: Date
        public var lastModifiedOn: Date
        
        public init(id: UUID, creator: User.UserX, communityID: UUID, parentMessageID: UUID? = nil, type: MessageType, text: String, sentTo: UUID? = nil, reportedItem: UUID? = nil, reportedComment: UUID? = nil, createdOn: Date, lastModifiedOn: Date) {
            self.id = id
            self.creator = creator
            self.communityID = communityID
            self.parentMessageID = parentMessageID
            self.type = type
            self.text = text
            self.sentTo = sentTo
            self.reportedItem = reportedItem
            self.reportedComment = reportedComment
            self.createdOn = createdOn
            self.lastModifiedOn = lastModifiedOn
        }
    }
}

public enum MessageType: String, Codable {
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
    public func convertToChatMessage() -> ChatMessage {
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
    static public var placeholder: ChatMessage {
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
    public func convertToChatMessage() -> [ChatMessage] {
        return map { $0.convertToChatMessage() }
    }
}
