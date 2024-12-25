//
//  CommunityMessageStore.swift
//  Items
//
//  Created by Ian on 06/04/2022.
//

import Foundation

public struct CommunityMessageStore: Codable, Equatable, Sendable {
    public var id: Identifier<Community> // UUID of community
    public var chatMessages: [ChatMessage]
    public var selectedChatMessage: ChatMessage = .placeholder
    public var messageIndex: Int = 0
    public var filterCreteria: MessagesFilterCriteria = .none
    public var sortCriteria: MessageSortCriteria = .newest
    
    public init(
        id: Identifier<Community>,
        chatMessages: [ChatMessage]
    ) {
        self.id = id
        self.chatMessages = chatMessages
    }
}

public enum MessagesFilterCriteria: String, Codable, Sendable {
    case none
    case notifications
    case reports
    case modMails
}

public enum MessageSortCriteria: String, Codable, Sendable {
    case newest
    case oldest
}
