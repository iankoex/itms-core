//
//  SearchObject.swift
//  ItemsCore
//
//  Created by Ian on 03/03/2022.
//

import Foundation

public struct SearchObject: Codable, Equatable {
    public var items: [Item]
    public var comments: [Comment]
    public var communities: [Community]
    public var tItems: Int
    public var tComments: Int
    public var tCommunities: Int
    
    public init(items: [Item], comments: [Comment], communities: [Community], tItems: Int, tComments: Int, tCommunities: Int) {
        self.items = items
        self.comments = comments
        self.communities = communities
        self.tItems = tItems
        self.tComments = tComments
        self.tCommunities = tCommunities
    }
}

extension SearchObject {
    public enum Spec: String, CaseIterable {
        case items
        case comments
        case communities
    }
}

public struct SearchRequest: Codable, Equatable {
    public var text: String
    public var page: Int
}
