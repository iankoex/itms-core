//
//  InviteCode.swift
//  ItemsCore
//
//  Created by Ian on 08/02/2022.
//

import Foundation

public struct Invite: Codable, Sendable, Identifiable {
    public var id: Identifier<Self>
    public var parentCommunityID: Identifier<Community>
    public var inviteCode: String
    public var uses: Int
    public var maxUses: Int?
    public var expireAfter: Date? // String Date
    public var timeStamp: TimeStampContainer
    
    public init(id: Identifier<Self> = Identifier(), parentCommunityID: Identifier<Community>, inviteCode: String, uses: Int, maxUses: Int? = nil, expireAfter: Date? = nil, timeStamp: TimeStampContainer) {
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
    public struct Create: Codable, Sendable {
        public var maxUses: Int?
        public var expireAfter: Int? // in seconds
        
        public init(maxUses: Int? = nil, expireAfter: Int? = nil) {
            self.maxUses = maxUses
            self.expireAfter = expireAfter
        }
    }
}
