//
//  AppDelegate.swift
//  Parstagram
//
//  Created by Joey Steigelman on 3/6/21.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "pRBqMVl2FQenldWXKJqrQ39XoZq7FBviCHWYfMdG" // <- UPDATE
                $0.clientKey = "ZMGZOW4BsZZCwszYB6FXWUPOK5WI0kF3YWebQM7h" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            let parseConfig = ParseClientConfiguration {
                    $0.applicationId = "pRBqMVl2FQenldWXKJqrQ39XoZq7FBviCHWYfMdG" // <- UPDATE
                    $0.clientKey = "ZMGZOW4BsZZCwszYB6FXWUPOK5WI0kF3YWebQM7h" // <- UPDATE
                    $0.server = "https://parseapi.back4app.com"
            }
            Parse.initialize(with: parseConfig)
            
            return true
        }
        
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

