//
//  UserModel.swift
//  VKApp
//
//  Created by Maxim Bekmetov on 12.08.2021.
//

import Foundation

struct UserModel: Codable {
    var userName: String
    var name: String
    var surName: String
    var fullName: String {
        return name + " " + surName
    }
    var password: String
    var avatar: String
    var location: String
    var favGroups: [GroupModel]
    var photos: [PhotoModel]
}
