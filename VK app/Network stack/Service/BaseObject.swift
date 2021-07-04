//
//  BaseObject.swift
//  VK app
//
//  Created by Maxim Bekmetov on 04.07.2021.
//

import Foundation
import RealmSwift
import DynamicJSON

public class BaseObject: Object {
    convenience required init(data: JSON) {
        self.init()
    }
}
