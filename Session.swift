//
//  Session.swift
//  VK app
//
//  Created by Maxim Bekmetov on 20.06.2021.
//

import Foundation

final class Session {
    
    static let shared = Session()
    
    private init() {
        
    }
    
    var token = ""
    var userId = ""
}
