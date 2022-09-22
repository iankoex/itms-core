//
//  ModAction.swift
//  Items
//
//  Created by Ian on 28/01/2022.
//

import Foundation

struct ModAction: Codable {
    var type: ModAction.ModActionType
    var itemID: UUID?
    var commentID: UUID?
    var reason: String
}

extension ModAction {
    enum ModActionType: String, Codable {
        case removeItem
        case removeComment
        case disableComments
        case disableReplies
    }
}
