//
//  Users.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct User: Codable, Identifiable, Hashable {
    public var id: UUID
    public var username: String
    public var displayName: String
    public var displayPicture: String
    public var backgroundPicture: String
    public var about: String
    public var itemsPoints: Int
    public var commentsPoints: Int
    public var createdOn: Date
    public var lastModifiedOn: Date
    
    public init(id: UUID, username: String, displayName: String, displayPicture: String, backgroundPicture: String, about: String, itemsPoints: Int, commentsPoints: Int, createdOn: Date, lastModifiedOn: Date) {
        self.id = id
        self.username = username
        self.displayName = displayName
        self.displayPicture = displayPicture
        self.backgroundPicture = backgroundPicture
        self.about = about
        self.itemsPoints = itemsPoints
        self.commentsPoints = commentsPoints
        self.createdOn = createdOn
        self.lastModifiedOn = lastModifiedOn
    }
}

// used to create the user during sign up
extension User {
    public struct Create: Codable {
        public var username: String
        public var password: String
        public var confirmPassword: String
        public var displayName: String
        public var displayPicture: String
        public var backgroundPicture: String
        public var about: String
        
        public init(username: String, password: String, confirmPassword: String, displayName: String, displayPicture: String, backgroundPicture: String, about: String) {
            self.username = username
            self.password = password
            self.confirmPassword = confirmPassword
            self.displayName = displayName
            self.displayPicture = displayPicture
            self.backgroundPicture = backgroundPicture
            self.about = about
        }
    }
}

extension User {
    static public var placeholder: User {
        User(
            id: UUID(uuidString: "555FAE8C-7692-4639-A2EF-274ECF05EBBE")!,
            username: "Placeholder",
            displayName: "Placeholder",
            displayPicture: "",
            backgroundPicture: "",
            about: "I am Just a Placeholder :(",
            itemsPoints: 0,
            commentsPoints: 0,
            createdOn: Date(),
            lastModifiedOn: Date()
        )
    }
}
