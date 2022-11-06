//
//  File.swift
//
//
//  Created by Ian on 05/11/2022.
//

import Foundation

public struct PagedItems: Codable, Equatable {
    public var items: [Item]
    public var totalItems: Int
    public var currentPage: Int
    public var totalPages: Int
    public var nextPage: Int = 1

    public init(items: [Item], totalItems: Int, currentPage: Int, totalPages: Int) {
        self.items = items
        self.totalItems = totalItems
        self.currentPage = currentPage
        self.totalPages = totalPages
    }

    public mutating func append(contentsOf newPagedItems: PagedItems) {
        guard newPagedItems.items.isNotEmpty else {
            return
        }
        if newPagedItems.currentPage == 1 {
            self.items = newPagedItems.items
        } else {
            self.items.append(contentsOf: newPagedItems.items)
        }
        self.totalItems = newPagedItems.totalItems
        self.currentPage = newPagedItems.currentPage
        self.totalPages = newPagedItems.totalPages
        self.nextPage = newPagedItems.currentPage + 1
    }

    public var canLoadMore: Bool {
        totalItems > items.count
    }
}

public extension PagedItems {
    static var initial: PagedItems {
        let pagedItems = PagedItems(
            items: [],
            totalItems: 0,
            currentPage: 1,
            totalPages: 1
        )
        return pagedItems
    }
}
