//
//  AppDelegate.swift
//  CurrencyConverter
//
//  Created by Riad on 5/22/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import UIKit
import DBDebugToolkit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let tapTrigger = DBTapTrigger(numberOfTouchesRequired: 3)
           let longPressTrigger = DBLongPressTrigger(minimumPressDuration: 1.0)
           let shakeTrigger = DBShakeTrigger()
           DBDebugToolkit.setup(with: [tapTrigger, longPressTrigger, shakeTrigger])
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

