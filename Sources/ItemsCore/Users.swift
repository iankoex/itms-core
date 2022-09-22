//
//  Users.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: UUID
    var username: String
    var displayName: String
    var displayPicture: String
    var backgroundPicture: String
    var about: String
    var itemsPoints: Int
    var commentsPoints: Int
    var createdOn: String
    var lastModifiedOn: String
}

extension User {
    // WebSocket returns a date and not string .utf8?
    struct UserX: Codable, Identifiable, Hashable {
        var id: UUID
        var username: String
        var displayName: String
        var displayPicture: String
        var backgroundPicture: String
        var about: String
        var itemsPoints: Int
        var commentsPoints: Int
        var createdOn: Date
        var lastModifiedOn: Date
    }
}

extension User.UserX {
    func convertToUser() -> User {
        let crOn = DateUtils.getString(date: createdOn)
        let lmOn = DateUtils.getString(date: lastModifiedOn)
        return User(id: id, username: username, displayName: displayName, displayPicture: displayPicture, backgroundPicture: backgroundPicture, about: about, itemsPoints: itemsPoints, commentsPoints: commentsPoints, createdOn: crOn, lastModifiedOn: lmOn)
    }
}

extension Collection where Element == User.UserX {
    func convertToUser() -> [User] {
        return map { $0.convertToUser() }
    }
}

// used to create the user during sign up
extension User {
    struct POST: Codable {
        var username: String
        var password: String
        var confirmPassword: String
        var displayName: String
        var displayPicture: String
        var backgroundPicture: String
        var about: String
    }
}

extension User {
    static var placeholder: User {
        User(
            id: UUID(uuidString: "555FAE8C-7692-4639-A2EF-274ECF05EBBE")!,
            username: "Placeholder",
            displayName: "Placeholder",
            displayPicture: "",
            backgroundPicture: "",
            about: "I am Just a Placeholder :(",
            itemsPoints: 0,
            commentsPoints: 0,
            createdOn: "",
            lastModifiedOn: ""
        )
    }
}

extension User.UserX {
    static var placeholder: User.UserX {
        User.UserX(
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
