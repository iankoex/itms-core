//
//  File.swift
//  
//
//  Created by Ian on 05/11/2022.
//

import Foundation

public struct PagedComments: Codable {
    public var comments: [Comment]
    public var totalComments: Int
    public var currentPage: Int
    public var totalPages: Int
    public var nextPage: Int = 1

    public init(comments: [Comment], totalComments: Int, currentPage: Int, totalPages: Int) {
        self.comments = comments
        self.totalComments = totalComments
        self.currentPage = currentPage
        self.totalPages = totalPages
    }

    public mutating func append(contentsOf newPagedComment: PagedComments) {
        self.comments.append(contentsOf: newPagedComment.comments)
        self.totalComments = newPagedComment.totalComments
        self.currentPage = newPagedComment.currentPage
        self.totalPages = newPagedComment.totalPages
        self.nextPage = newPagedComment.currentPage + 1
    }
}

public extension PagedComments {
    static var initial: PagedComments {
        let pagedCommets = PagedComments(
            comments: [],
            totalComments: 0,
            currentPage: 1,
            totalPages: 1
        )
        return pagedCommets
    }
}
