//
//  AppDelegate.swift
//  Todoee
//
//  Created by Ali on 11/1/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//This happens when app did load before viewdidload
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        //       Realm allow us to use OOP and Presist data
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        return true
    }

}

