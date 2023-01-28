//
//  File.swift
//
//
//  Created by Ian on 05/11/2022.
//

import Foundation

public struct PagedStoas: Codable, Sendable, Equatable {
    public var stoas: [Stoa]
    public var totalStoas: Int
    public var currentPage: Int
    public var totalPages: Int
    public var nextPage: Int = 1

    public init(stoas: [Stoa], totalStoas: Int, currentPage: Int, totalPages: Int) {
        self.stoas = stoas
        self.totalStoas = totalStoas
        self.currentPage = currentPage
        self.totalPages = totalPages
    }

    public mutating func append(contentsOf newPagedStoas: PagedStoas) {
        guard newPagedStoas.stoas.isNotEmpty else {
            return
        }
        if newPagedStoas.currentPage == 1 {
            self.stoas = newPagedStoas.stoas
        } else {
            self.stoas.append(contentsOf: newPagedStoas.stoas)
        }
        self.totalStoas = newPagedStoas.totalStoas
        self.currentPage = newPagedStoas.currentPage
        self.totalPages = newPagedStoas.totalPages
        self.nextPage = newPagedStoas.currentPage + 1
    }

    public var canLoadMore: Bool {
        totalStoas > stoas.count
    }
}

public extension PagedStoas {
    static var initial: PagedStoas {
        let pagedItems = PagedStoas(
            stoas: [],
            totalStoas: 0,
            currentPage: 1,
            totalPages: 1
        )
        return pagedItems
    }
}
