//
//  AppDelegate.swift
//  SelectItemControllerSample
//
//  Created by keygx on 2019/09/29.
//  Copyright © 2019 keygx. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    lazy var appEventHandler = AppEventHandler()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {} else {
            window = appEventHandler.createWindow()
            window?.makeKeyAndVisible()
        }
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appEventHandler.didBecomeActive()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        appEventHandler.willResignActive()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        appEventHandler.willEnterForeground()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        appEventHandler.didEnterBackground()
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
