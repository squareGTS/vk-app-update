//
//  Groups.swift
//  VK app
//
//  Created by Maxim Bekmetov on 27.06.2021.
//

import Foundation
import RealmSwift

// MARK: - Groups
struct Groups: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [Groupp]
}

// MARK: - Item
class Groupp: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var extended, trackCode, name: String?
    @objc dynamic var photo100: String?
   // let deactivated: DeactivatedGroup?

    enum CodingKeys: String, CodingKey {
        case id
        case extended =  "1"
        case trackCode = "track_code"
        case name = "name"
        case photo100 = "photo_100"
       // case deactivated
    }
}

//enum DeactivatedGroup: String, Codable {
//    case banned = "banned"
//    case deleted = "deleted"
//}
