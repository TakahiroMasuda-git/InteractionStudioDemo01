//
//  AppDelegate.swift
//  InteractionStudioDemo01
//
//  Created by Takahiro Masuda on 2021/02/10.
//  Copyright © 2021 salesforce.com. All rights reserved.
//

import UIKit
import Evergage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let evergage = Evergage.sharedInstance()
    var userId:String?
    var mobileDataCampaignTarget:String?
    var mobileDataCampaignAction:String?
    var itemActionSelectedProductIndex:Int?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let evergageFilePath = Bundle.main.path(forResource: "Evergage", ofType:"plist" )
        let evergagePlist:NSDictionary = NSDictionary(contentsOfFile: evergageFilePath!)!
        // For the DEBUG conditional to work in Swift, you must edit your project/target's Build Settings:
        // Expand "Other Swift Flags" and add "-DDEBUG" under Debug. Do not add to Release!
    #if DEBUG
        evergage.logLevel = EVGLogLevel.debug
    #endif

        // Recommended to set the authenticated user's ID as soon as known:
        userId = evergagePlist["userId"] as? String
        if(userId.isNotEmpty()){
            evergage.userId = userId
        }
        // Start Evergage with your Evergage Configuration:
        evergage.start { (clientConfigurationBuilder) in
            clientConfigurationBuilder.account = evergagePlist["account"] as! String
            clientConfigurationBuilder.dataset = evergagePlist["dataset"] as! String
            clientConfigurationBuilder.usePushNotifications = evergagePlist["usePushNotifications"] as! Bool
            clientConfigurationBuilder.useDesignMode = true
        }

        // ... existing code from your app starts here
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

