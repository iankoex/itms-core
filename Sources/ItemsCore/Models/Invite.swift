//
//  InviteCode.swift
//  Items
//
//  Created by Ian on 08/02/2022.
//

import Foundation

public struct Invite: Codable, Identifiable {
    public var id: UUID
    public var parentCommunityID: UUID
    public var inviteCode: String
    public var uses: Int
    public var maxUses: Int?
    public var expireAfter: String? // String Date
    public var createdOn: String // String Date
    
    public init(id: UUID, parentCommunityID: UUID, inviteCode: String, uses: Int, maxUses: Int? = nil, expireAfter: String? = nil, createdOn: String) {
        self.id = id
        self.parentCommunityID = parentCommunityID
        self.inviteCode = inviteCode
        self.uses = uses
        self.maxUses = maxUses
        self.expireAfter = expireAfter
        self.createdOn = createdOn
    }
}

extension Invite {
    public struct POST: Codable {
        public var maxUses: Int?
        public var expireAfter: Int? // in seconds
        
        public init(maxUses: Int? = nil, expireAfter: Int? = nil) {
            self.maxUses = maxUses
            self.expireAfter = expireAfter
        }
    }
}
