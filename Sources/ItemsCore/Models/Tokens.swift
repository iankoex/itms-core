//
//  Tokens.swift
//  ItemsCore
//
//  Created by Ian on 21/11/2021.
//

import Foundation

public struct Token: Codable {
    public var id: UUID
    public var user: TokenUser
    public var value: String
}

public struct TokenUser: Codable {
    public var id: UUID
}
