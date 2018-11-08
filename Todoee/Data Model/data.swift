//
//  data.swift
//  Todoee
//
//  Created by Ali on 11/7/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
//Dynamic = decleration modifire to be used using realm database
//    @objc to indicate the objective C Dynamics
    
    
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    
    
    
}
