//
//  InviteCode.swift
//  Items
//
//  Created by Ian on 08/02/2022.
//

import Foundation

struct Invite: Codable, Identifiable {
    var id: UUID
    var parentCommunityID: UUID
    var inviteCode: String
    var uses: Int
    var maxUses: Int?
    var expireAfter: String? // String Date
    var createdOn: String // String Date
}

extension Invite {
    struct POST: Codable {
        var maxUses: Int?
        var expireAfter: Int? // in seconds
    }
}
