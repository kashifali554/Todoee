//
//  Category.swift
//  Todoee
//
//  Created by Ali on 11/7/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
//    forming the realationship
    let items = List<Item>()
    
}
