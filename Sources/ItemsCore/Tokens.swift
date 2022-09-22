//
//  Tokens.swift
//  Items
//
//  Created by ian on 21/11/2021.
//

import Foundation

struct Token: Codable {
    var id: UUID
    var user: TokenUser
    var value: String
}

struct TokenUser: Codable {
    var id: UUID
}
