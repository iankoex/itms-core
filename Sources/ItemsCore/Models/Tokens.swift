//
//  Tokens.swift
//  ItemsCore
//
//  Created by Ian on 21/11/2021.
//

import Foundation

public struct LoginToken: Codable, Sendable {
    public var id: UUID
    public var userID: UUID
    public var value: String
    
    public init(id: UUID, userID: UUID, value: String) {
        self.id = id
        self.userID = userID
        self.value = value
    }
}
