//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        print("AppDidFinishLaunchingWithOptions")
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemGray
        
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]

            let buttonAppearance = UIBarButtonItemAppearance()
            buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.buttonAppearance = buttonAppearance

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance

            UIBarButtonItem.appearance().tintColor = UIColor.white
        } else {
            UINavigationBar.appearance().barTintColor = UIColor.black
            UINavigationBar.appearance().titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            UINavigationBar.appearance().tintColor = UIColor.white

            UIBarButtonItem.appearance().tintColor = UIColor.white
        }
        return true

    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("AppWillEnterForegroudn")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("AppDidBecomeActive")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("AppWillResignActive")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("appDidEnterBackground")
    }

}

