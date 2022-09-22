//
//  SearchObject.swift
//  Items
//
//  Created by Ian on 03/03/2022.
//

import Foundation

struct SearchObject: Codable ,Equatable {
    static func == (lhs: SearchObject, rhs: SearchObject) -> Bool {
        lhs.items == rhs.items &&
        lhs.comments == rhs.comments &&
        lhs.communities == rhs.communities
    }
    
    var items: [Item]
    var comments: [Comment]
    var communities: [Community]
    var tItems: Int
    var tComments: Int
    var tCommunities: Int
}

extension SearchObject {
    struct GET: Codable {
        var items: [Item]
        var comments: [Comment.GET]
        var communities: [Community]
        var tItems: Int
        var tComments: Int
        var tCommunities: Int
    }
}

extension SearchObject.GET {
    func convertToSearchObject() -> SearchObject {
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
    enum Spec: String, CaseIterable {
        case items
        case comments
        case communities
    }
}
