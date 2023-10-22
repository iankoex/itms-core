//
//  File.swift
//  
//
//  Created by Ian on 29/11/2022.
//

import Foundation

/*
 // when uploading picture
 upload in 4 qualities
 1. high
 2. medium
 3. low
 4. thumbnail

 url/image will return high
 url/image/(medium/low/thumbnail) will return the respective
 */

public struct PictureContainer: Codable, Sendable, Equatable, Hashable  {
    public var blurHashString: String
    public var lowQualityURL: URL
    public var originalQualityURL: URL // High Quality

    public init(blurHashString: String, lowQualityURL: URL, originalQualityURL: URL) {
        self.blurHashString = blurHashString
        self.lowQualityURL = lowQualityURL
        self.originalQualityURL = originalQualityURL
    }
}

public extension PictureContainer {
    static var placeholder: PictureContainer {
//        let url = URL(string: "https://picsum.photos/id/\(Int.random(in: 0...999))/200/300")!
        let url = URL(string: "https://picsum.photos/id/67/200/300")!
        return PictureContainer(
            blurHashString: "LVN^Odxa?WNa-;WB£,WBs;baR*af",
            lowQualityURL: url,
            originalQualityURL: url
        )
    }
    
    static var staticPlaceholder: PictureContainer {
        let url = URL(string: "https://picsum.photos/id/321/200/300")!
        return PictureContainer(
            blurHashString: "LVN^Odxa?WNa-;WB£,WBs;baR*af",
            lowQualityURL: url,
            originalQualityURL: url
        )
    }
}
