//
//  VideoResponse.swift
//  MovieBoxs
//
//  Created by Rarito on 17/08/23.
//

import Foundation

struct VideoResponse: Decodable {
    let id: Int
    let results: [Video]
}

struct Video: Decodable {
    let name, key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt, id: String

    internal enum CodingKeys: String, CodingKey {
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}
