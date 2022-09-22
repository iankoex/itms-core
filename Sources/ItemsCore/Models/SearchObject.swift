//
//  SearchObject.swift
//  Items
//
//  Created by Ian on 03/03/2022.
//

import Foundation

public struct SearchObject: Codable ,Equatable {
    public static func == (lhs: SearchObject, rhs: SearchObject) -> Bool {
        lhs.items == rhs.items &&
        lhs.comments == rhs.comments &&
        lhs.communities == rhs.communities
    }
    
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
    public struct GET: Codable {
        public var items: [Item]
        public var comments: [Comment.GET]
        public var communities: [Community]
        public var tItems: Int
        public var tComments: Int
        public var tCommunities: Int
        
        public init(items: [Item], comments: [Comment.GET], communities: [Community], tItems: Int, tComments: Int, tCommunities: Int) {
            self.items = items
            self.comments = comments
            self.communities = communities
            self.tItems = tItems
            self.tComments = tComments
            self.tCommunities = tCommunities
        }
    }
}

extension SearchObject.GET {
    public func convertToSearchObject() -> SearchObject {
        return SearchObject(
            items: items,
            comments: comments.convertToComment(),
            communities: communities,
            tItems: tItems,
            tComments: tComments,
            tCommunities: tCommunities
        )
    }
}

extension SearchObject {
    public enum Spec: String, CaseIterable {
        case items
        case comments
        case communities
    }
}
