//
//  SearchObject.swift
//  ItemsCore
//
//  Created by Ian on 03/03/2022.
//

import Foundation

public struct SearchObject: Codable, Sendable, Equatable {
    public var pagedItems: PagedItems
    public var pagedComments: PagedComments
    public var pagedCommunities: PagedCommunities
    public var pagedStoas: PagedStoas

    public init(
        pagedItems: PagedItems,
        pagedComments: PagedComments,
        pagedCommunities: PagedCommunities,
        pagedStoas: PagedStoas
    ) {
        self.pagedItems = pagedItems
        self.pagedComments = pagedComments
        self.pagedCommunities = pagedCommunities
        self.pagedStoas = pagedStoas
    }
}

extension SearchObject {
    public enum Spec: String, CaseIterable, Sendable {
        case items
        case comments
        case communities
        case stoas
    }
}

public extension SearchObject {
    static var initial: SearchObject {
        SearchObject(pagedItems: .initial, pagedComments: .initial, pagedCommunities: .initial, pagedStoas: .initial)
    }
}

public struct SearchRequest: Codable, Sendable, Equatable {
    public var text: String
    public var page: Int
}
