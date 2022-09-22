//
//  Stoa.swift
//  Items
//
//  Created by Ian on 09/08/2022.
//

import Foundation

struct Stoa: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    var name: String
    var description: String // from its items description
    var startTime: String
    var creator: User
    var community: Community
    var itemID: UUID
    var thumbnailURL: String // From the item thumnail url
}

extension Stoa {
    static var placeholder: Stoa {
        let stoa = Stoa(
            id: UUID(),
            name: "placeholder",
            description: "TY",
            startTime: "2022-08-20T06:08:55Z",
            creator: User.UserX.placeholder.convertToUser(),
            community: Community.placeholder,
            itemID: UUID(),
            thumbnailURL: "https://ia800705.us.archive.org/12/items/chris-kenny_live_ASMR/ASMR.png"
        )
        return stoa
    }
}

extension Stoa {
    struct POST: Codable {
        let name: String
        let startTime: String
    }
}

extension Stoa {
    struct Token: Codable {
        let id: UUID
        let value: String
    }
}

extension Stoa {
    struct ForItem: Codable, Hashable {
        var id: UUID
        var name: String
        var description: String
        var startTime: String
        var creatorID: UUID
        var communityID: UUID
        var itemID: UUID
    }
}
