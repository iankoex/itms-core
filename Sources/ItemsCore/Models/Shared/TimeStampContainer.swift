//
//  TimeStampContainer.swift
//  
//
//  Created by Ian on 13/12/2022.
//

import Foundation

public struct TimeStampContainer: Codable, Sendable, Equatable, Hashable {
    public var createdOn: Date
    public var lastModifiedOn: Date

    public init(createdOn: Date, lastModifiedOn: Date) {
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
    }
}

public extension TimeStampContainer {
    static var now: TimeStampContainer {
        let date = Date()
        return TimeStampContainer(createdOn: date, lastModifiedOn: date)
    }
}
