//
//  Response.swift
//  VKApp
//
//  Created by Maxim Bekmetov on 29.09.2021.
//

import Foundation

class Response<T: Codable>: Codable {
    let response: Items<T>

}

class Items<T: Codable>: Codable {
    let items: [T]
}

//class ResponseJoin: Codable {
//    let response: Int
//}
