//
//  Audits.swift
//  ItemsCore
//
//  Created by Ian on 09/08/2021.
//

import Foundation

public struct Audit: Identifiable, Codable, Equatable, Sendable {
    public var id: Identifier<Self>
    public var mod: User
    public var communityID: Identifier<Community>
    public var text: String
    public var timeStamp: TimeStampContainer
    
    public init(
        id: Identifier<Self> = Identifier(),
        mod: User,
        communityID: Identifier<Community>,
        text: String,
        timeStamp: TimeStampContainer
    ) {
        self.id = id
        self.mod = mod
        self.communityID = communityID
        self.text = text
        self.timeStamp = timeStamp
    }
}
