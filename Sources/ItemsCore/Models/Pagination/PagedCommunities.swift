//
//  File.swift
//
//
//  Created by Ian on 05/11/2022.
//

import Foundation

public struct PagedCommunities: Codable, Equatable {
    public var communities: [Community]
    public var totalCommunities: Int
    public var currentPage: Int
    public var totalPages: Int
    public var nextPage: Int = 1

    public init(communities: [Community], totalCommunities: Int, currentPage: Int, totalPages: Int) {
        self.communities = communities
        self.totalCommunities = totalCommunities
        self.currentPage = currentPage
        self.totalPages = totalPages
    }

    public mutating func append(contentsOf newPagedCommunities: PagedCommunities) {
        guard newPagedCommunities.communities.isNotEmpty else {
            return
        }
        if newPagedCommunities.currentPage == 1 {
            self.communities = newPagedCommunities.communities
        } else {
            self.communities.append(contentsOf: newPagedCommunities.communities)
        }
        self.totalCommunities = newPagedCommunities.totalCommunities
        self.currentPage = newPagedCommunities.currentPage
        self.totalPages = newPagedCommunities.totalPages
        self.nextPage = newPagedCommunities.currentPage + 1
    }

    public var canLoadMore: Bool {
        totalCommunities > communities.count
    }
}

public extension PagedCommunities {
    static var initial: PagedCommunities {
        let PagedCommunities = PagedCommunities(
            communities: [],
            totalCommunities: 0,
            currentPage: 1,
            totalPages: 1
        )
        return PagedCommunities
    }
}
