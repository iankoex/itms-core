//
//  Stoa.swift
//  Items
//
//  Created by Ian on 09/08/2022.
//

import Foundation

public struct Stoa: Identifiable, Codable, Equatable, Hashable {
    public var id: UUID
    public var name: String
    public var description: String // from its items description
    public var startTime: String
    public var creator: User
    public var community: Community
    public var itemID: UUID
    public var thumbnailURL: String // From the item thumnail url
    
    public init(id: UUID, name: String, description: String, startTime: String, creator: User, community: Community, itemID: UUID, thumbnailURL: String) {
        self.id = id
        self.name = name
        self.description = description
        self.startTime = startTime
        self.creator = creator
        self.community = community
        self.itemID = itemID
        self.thumbnailURL = thumbnailURL
    }
}

extension Stoa {
    static public var placeholder: Stoa {
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
    public struct POST: Codable {
        public let name: String
        public let startTime: String
        
        public init(name: String, startTime: String) {
            self.name = name
            self.startTime = startTime
        }
    }
}

extension Stoa {
    public struct Token: Codable {
        public let id: UUID
        public let value: String
    }
}

extension Stoa {
    public struct ForItem: Codable, Hashable {
        public var id: UUID
        public var name: String
        public var description: String
        public var startTime: String
        public var creatorID: UUID
        public var communityID: UUID
        public var itemID: UUID
        
        public init(id: UUID, name: String, description: String, startTime: String, creatorID: UUID, communityID: UUID, itemID: UUID) {
            self.id = id
            self.name = name
            self.description = description
            self.startTime = startTime
            self.creatorID = creatorID
            self.communityID = communityID
            self.itemID = itemID
        }
    }
}
