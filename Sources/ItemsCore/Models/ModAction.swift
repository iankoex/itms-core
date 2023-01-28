//
//  ModAction.swift
//  ItemsCore
//
//  Created by Ian on 28/01/2022.
//

import Foundation

public struct ModAction: Codable, Sendable {
    public var type: ModAction.ModActionType
    public var itemID: UUID?
    public var commentID: UUID?
    public var reason: String
    
    public init(type: ModAction.ModActionType, itemID: UUID? = nil, commentID: UUID? = nil, reason: String) {
        self.type = type
        self.itemID = itemID
        self.commentID = commentID
        self.reason = reason
    }
}

extension ModAction {
    public enum ModActionType: String, Codable, Sendable {
        case removeItem
        case removeComment
        case disableComments
        case disableReplies

        public var rawValue: String {
            switch self {
            case .removeItem: return "Remove Item"
            case .removeComment: return "Remove Comment"
            case .disableComments: return "Disable Comments"
            case .disableReplies: return "Disable Replies"
            }
        }
    }
}
