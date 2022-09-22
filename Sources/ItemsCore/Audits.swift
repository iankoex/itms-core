//
//  Audits.swift
//  Items
//
//  Created by Ian on 09/08/2021.
//

import Foundation

struct Audit: Identifiable, Codable {
    var id: UUID
    var mod: User
    var communityID: UUID
    var text: String
    var createdOn: String
}

struct CommunityID: Codable {
    var id: UUID
}
