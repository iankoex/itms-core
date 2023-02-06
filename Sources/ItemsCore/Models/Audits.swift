//
//  Audits.swift
//  ItemsCore
//
//  Created by Ian on 09/08/2021.
//

import Foundation

public struct Audit: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var mod: User
    public var communityID: UUID
    public var text: String
    public var timeStamp: TimeStampContainer
    
    public init(id: UUID, mod: User, communityID: UUID, text: String, timeStamp: TimeStampContainer) {
        self.id = id
        self.mod = mod
        self.communityID = communityID
        self.text = text
        self.timeStamp = timeStamp
    }
}
