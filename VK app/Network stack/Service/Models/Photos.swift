//
//  Photos.swift
//  VK app
//
//  Created by Maxim Bekmetov on 27.06.2021.
//

import Foundation

// MARK: - Photos
struct Photos: Codable {
    let response: ResponsePhoto
}

// MARK: - Response
struct ResponsePhoto: Codable {
    let count: Int
    let items: [Photoo]
}

// MARK: - Item
struct Photoo: Codable {
    let id: Int
    let albumId, photoIds, photoSizes: String?
    let deactivated: DeactivatedPhoto?

    enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case photoIds = "photo_ids"
        case photoSizes = "1"
        case deactivated
    }
}

enum DeactivatedPhoto: String, Codable {
    case banned = "banned"
    case deleted = "deleted"
}
