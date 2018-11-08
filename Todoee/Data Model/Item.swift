//
//  Item.swift
//  Todoee
//
//  Created by Ali on 11/7/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
   @objc dynamic var title : String = ""
   @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
