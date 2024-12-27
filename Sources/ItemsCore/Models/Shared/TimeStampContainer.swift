//
//  TimeStampContainer.swift
//  
//
//  Created by Ian on 13/12/2022.
//

import Foundation

public struct TimeStampContainer: Codable, Sendable, Equatable, Hashable {
    public var createdOn: Date
    public var modifiedOn: Date

    public init(createdOn: Date, modifiedOn: Date) {
        self.createdOn = createdOn
        self.modifiedOn = modifiedOn
    }
}

public extension TimeStampContainer {
    static var now: TimeStampContainer {
        let date = Date()
        return TimeStampContainer(createdOn: date, modifiedOn: date)
    }
}
