//
//  GroupModel.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

struct Group: Equatable {
    var avatar: UIImage?
    var name: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
    
    static var list: [Group] = [Group(avatar:  UIImage(named: "g-1"), name: "Stars"),
                                Group(avatar:  UIImage(named: "g-2"), name: "Models"),
                                Group(avatar:  UIImage(named: "g-3"), name: "Cars"),
                                Group(avatar:  UIImage(named: "g-4"), name: "Apple"),
                                Group(avatar:  UIImage(named: "g-5"), name: "Audio"),
    ]
}
