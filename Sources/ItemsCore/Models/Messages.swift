//
//  Messages.swift
//  ItemsCore
//
//  Created by Ian on 24/12/2021.
//

import Foundation

public struct ChatMessage: Codable, Sendable, Identifiable, Equatable, Hashable {
    public var id: Identifier<Self>
    public var creator: User
    public var communityID: Identifier<Community> // UUID of the community
    public var parentMessageID: Identifier<Self>?
    public var type: MessageType
    public var text: String
    public var sentTo: Identifier<User>?
    public var reportedItem: Identifier<Item>?
    public var reportedComment: Identifier<Comment>?
    public var replies: [ChatMessage]
    public var draftText: String // the message being typed
    public var timeStamp: TimeStampContainer
    
    public init(
        id: Identifier<Self> = Identifier(),
        creator: User,
        communityID: Identifier<Community>,
        parentMessageID: Identifier<Self>? = nil,
        type: MessageType,
        text: String,
        sentTo: Identifier<User>? = nil,
        reportedItem: Identifier<Item>? = nil,
        reportedComment: Identifier<Comment>? = nil,
        replies: [ChatMessage],
        draftText: String,
        timeStamp: TimeStampContainer
    ) {
        self.id = id
        self.creator = creator
        self.communityID = communityID
        self.parentMessageID = parentMessageID
        self.type = type
        self.text = text
        self.sentTo = sentTo
        self.reportedItem = reportedItem
        self.reportedComment = reportedComment
        self.replies = replies
        self.draftText = draftText
        self.timeStamp = timeStamp
    }
}

extension ChatMessage {
    public struct Create: Codable, Sendable {
        public var text: String
        public var communityID: Identifier<Community>
        public var type: MessageType
        public var parentMessageID: Identifier<ChatMessage>?
        public var afterDate: Date
        public var sendTo: Identifier<User>?
        public var itemID: Identifier<Item>?
        public var commentID: Identifier<Comment>?
        public var page: Int
        
        public init(
            text: String,
            communityID: Identifier<Community>,
            type: MessageType,
            parentMessageID: Identifier<ChatMessage>? = nil,
            afterDate: Date,
            sendTo: Identifier<User>? = nil,
            itemID: Identifier<Item>? = nil,
            commentID: Identifier<Comment>? = nil,
            page: Int
        ) {
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
    public enum MessageType: String, Codable, Sendable {
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
}

extension ChatMessage {
    static public var placeholder: ChatMessage {
        ChatMessage(
            id: Identifier("555FAE8C-7692-4639-A2EF-274ECF05EBBE"),
            creator: User.placeholder,
            communityID: Identifier(),
            type: .normal,
            text: "I am just a Placeholder. I am doing it out of my own will. :(",
            replies: [],
            draftText: "",
            timeStamp: .now
        )
    }
}
