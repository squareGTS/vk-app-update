//
//  Session.swift
//  VK app
//
//  Created by Maxim Bekmetov on 20.06.2021.
//

import Foundation

final class Session {
    private init() {
        
    }
    
    static let shared = Session()
    
    var token: String = ""
    var userId: Int = 0
}
