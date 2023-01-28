//
//  Users.swift
//  ItemsCore
//
//  Created by Ian on 16/06/2021.
//

import Foundation

public struct User: Codable, Sendable, Identifiable, Hashable, Equatable {
    public var id: UUID
    public var username: String
    public var displayName: String
    public var pictures: User.Pictures
    public var about: String
    public var itemsPoints: Int
    public var commentsPoints: Int
    public var timeStamp: TimeStampContainer
    
    public init(id: UUID, username: String, displayName: String, pictures: User.Pictures, about: String, itemsPoints: Int, commentsPoints: Int, timeStamp: TimeStampContainer) {
        self.id = id
        self.username = username
        self.displayName = displayName
        self.pictures = pictures
        self.about = about
        self.itemsPoints = itemsPoints
        self.commentsPoints = commentsPoints
        self.timeStamp = timeStamp
    }
}

extension User {
    public struct Pictures: Codable, Sendable, Equatable, Hashable {
        public var displayPicture: PictureContainer
        public var backgroundPicture: PictureContainer

        public init(displayPicture: PictureContainer, backgroundPicture: PictureContainer) {
            self.displayPicture = displayPicture
            self.backgroundPicture = backgroundPicture
        }
    }
}

extension User.Pictures {
    static public var placeholder: User.Pictures = .init(
        displayPicture: .placeholder,
        backgroundPicture: .placeholder
    )
}

// used to create the user during sign up
extension User {
    public struct Create: Codable, Sendable {
        public var username: String
        public var password: String
        public var confirmPassword: String
        public var displayName: String
        public var pictures: User.Pictures
        public var about: String
        
        public init(username: String, password: String, confirmPassword: String, displayName: String, pictures: User.Pictures, about: String) {
            self.username = username
            self.password = password
            self.confirmPassword = confirmPassword
            self.displayName = displayName
            self.pictures = pictures
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
            pictures: .placeholder,
            about: "I am Just a Placeholder :(",
            itemsPoints: 0,
            commentsPoints: 0,
            timeStamp: .now
        )
    }
}
