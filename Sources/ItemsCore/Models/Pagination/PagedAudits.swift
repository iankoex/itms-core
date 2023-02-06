//
//  File.swift
//  
//
//  Created by Ian on 06/02/2023.
//

import Foundation

public struct PagedAudits: Codable, Sendable, Equatable {
    public var audits: [Audit]
    public var totalAudits: Int
    public var currentPage: Int
    public var totalPages: Int
    public var nextPage: Int = 1
    
    public init(audits: [Audit], totalAudits: Int, currentPage: Int, totalPages: Int) {
        self.audits = audits
        self.totalAudits = totalAudits
        self.currentPage = currentPage
        self.totalPages = totalPages
    }
    
    public mutating func append(contentsOf newPagedAudits: PagedAudits) {
        guard newPagedAudits.audits.isNotEmpty else {
            return
        }
        if newPagedAudits.currentPage == 1 {
            self.audits = newPagedAudits.audits
        } else {
            self.audits.append(contentsOf: newPagedAudits.audits)
        }
        self.totalAudits = newPagedAudits.totalAudits
        self.currentPage = newPagedAudits.currentPage
        self.totalPages = newPagedAudits.totalPages
        self.nextPage = newPagedAudits.currentPage + 1
    }
    
    public var canLoadMore: Bool {
        totalAudits > audits.count
    }
}

public extension PagedAudits {
    static var initial: PagedAudits {
        let pagedItems = PagedAudits(
            audits: [],
            totalAudits: 0,
            currentPage: 1,
            totalPages: 1
        )
        return pagedItems
    }
}
