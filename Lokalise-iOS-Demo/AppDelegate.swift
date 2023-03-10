//
//  AppDelegate.swift
//  Lokalise-iOS-Demo
//
//  Created by Chia Wei Zheng Terry on 20/2/23.
//

import UIKit
import Lokalise

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Lokalise.shared.setProjectID("6348125463eb5f91dc9054.82140054", token: "bf56a89e8912ee949c503d41d6f47905bf22")
        
        Lokalise.shared.swizzleMainBundle()
        
        Lokalise.shared.localizationType = .release
        
        Lokalise.shared.checkForUpdates { (updated, errorOrNil) in
            print("Updated: \(updated)\nError: \(errorOrNil)")
            
            print("""
                        Locale
                        
                        Locale.preferredLanguages
                        \(Locale.preferredLanguages)
                        Locale.current.identifier
                        \(Locale.current.identifier)
                        
                        
                        Bundle
                        
                        Bundle.main.localizations
                        \(Bundle.main.localizations)
                        Bundle.main.preferredLocalizations
                        \(Bundle.main.preferredLocalizations)
                        Bundle.main.developmentLocalization
                        \(Bundle.main.developmentLocalization ?? "undefined")
                        
                        
                        Lokalise
                        
                        Lokalise.shared.availableLocales .identifier
                        \(Lokalise.shared.availableLocales().map({$0.identifier}))
                        Lokalise.shared.localizationLocale.identifier
                        \(Lokalise.shared.localizationLocale.identifier)
                        Lokalise.shared.lokaliseBundleVersion
                        \(Lokalise.shared.lokaliseBundleVersion)
                        LokaliseFrameworkVersion
                        \(LokaliseFrameworkVersion)
                        """)
            
            
        }
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
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

