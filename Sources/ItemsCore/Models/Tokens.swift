//
//  Tokens.swift
//  ItemsCore
//
//  Created by Ian on 21/11/2021.
//

import Foundation

public struct LoginToken: Codable, Sendable {
    public var id: Identifier<LoginToken>
    public var userID: Identifier<User>
    public var value: String
    
    public init(id: Identifier<LoginToken> = Identifier(), userID: Identifier<User>, value: String) {
        self.id = id
        self.userID = userID
        self.value = value
    }
}
