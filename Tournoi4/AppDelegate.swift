//
//  AppDelegate.swift
//  Tournoi4
//
//  Created by Apple Esprit on 16/11/2021.
//

import UIKit
import GoogleSignIn
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    /* func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Google
               GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                   if error != nil || user == nil {
                       // Show the app's signed-out state.
                   } else {
                       // Show the app's signed-in state.
                   }
               }
               
        ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
        
        return true
    }
    
    func application(
           _ app: UIApplication,
           open url: URL,
           options: [UIApplication.OpenURLOptionsKey : Any] = [:]
       ) -> Bool {

           ApplicationDelegate.shared.application(
               app,
               open: url,
               sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
               annotation: options[UIApplication.OpenURLOptionsKey.annotation]
           )
       }  
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }*/

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}



