//
//  Category.swift
//  Todoee
//
//  Created by Ali on 11/7/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import Foundation
import RealmSwift
//Object is super class from realm
class Category: Object {
//    @objc and dynamics to use for realm data
    @objc dynamic var name : String = ""
//    forming the realationship, List is coming from Realm and collection of item objects which are coming from item
    let items = List<Item>()
    
}
