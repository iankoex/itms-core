//
//  InviteCode.swift
//  ItemsCore
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
    public var expireAfter: Date? // String Date
    public var timeStamp: TimeStampContainer
    
    public init(id: UUID, parentCommunityID: UUID, inviteCode: String, uses: Int, maxUses: Int? = nil, expireAfter: Date? = nil, timeStamp: TimeStampContainer) {
        self.id = id
        self.parentCommunityID = parentCommunityID
        self.inviteCode = inviteCode
        self.uses = uses
        self.maxUses = maxUses
        self.expireAfter = expireAfter
        self.timeStamp = timeStamp
    }
}

extension Invite {
    public struct Create: Codable {
        public var maxUses: Int?
        public var expireAfter: Int? // in seconds
        
        public init(maxUses: Int? = nil, expireAfter: Int? = nil) {
            self.maxUses = maxUses
            self.expireAfter = expireAfter
        }
    }
}
