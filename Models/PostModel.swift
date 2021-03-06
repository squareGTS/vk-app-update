//
//  PostModel.swift
//  VKApp
//
//  Created by Maxim Bekmetov on 19.08.2021.
//

struct PostModel {
    let author: UserModel
    let timeStamp: String
    var text: String
    var media: String
    var likeCount: Int
    var commentMessages: [String]
    var isLike: Bool {
        didSet {
            likeCount += isLike ? 1 : -1
        }
    }
}
