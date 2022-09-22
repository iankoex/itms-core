//
//  Topics.swift
//  Items
//
//  Created by Ian on 16/06/2021.
//

import Foundation

struct Topic: Codable, Identifiable {
    var id: UUID
    var topicName: String
    var createdOn: String
    var lastModifiedOn: String
}

extension Topic {
    struct TopicX: Codable, Identifiable {
        var id: UUID
        var topicName: String
        var createdOn: Date
        var lastModifiedOn: Date
    }
}

extension Topic.TopicX {
    func convertToTopic() -> Topic {
        let crOn = DateUtils.getString(date: createdOn)
        let lmOn = DateUtils.getString(date: lastModifiedOn)
        return Topic(id: id, topicName: topicName, createdOn: crOn, lastModifiedOn: lmOn)
    }
}

extension Collection where Element == Topic.TopicX {
    func convertToTopic() -> [Topic] {
        return map { $0.convertToTopic() }
    }
}
