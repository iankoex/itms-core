//
//  Audits.swift
//  Items
//
//  Created by Ian on 09/08/2021.
//

import Foundation

public struct Audit: Identifiable, Codable {
    public var id: UUID
    public var mod: User
    public var communityID: UUID
    public var text: String
    public var createdOn: String
    
    public init(id: UUID, mod: User, communityID: UUID, text: String, createdOn: String) {
        self.id = id
        self.mod = mod
        self.communityID = communityID
        self.text = text
        self.createdOn = createdOn
    }
}

public struct CommunityID: Codable {
    public var id: UUID
}
