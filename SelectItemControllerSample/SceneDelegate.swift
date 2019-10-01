//
//  SceneDelegate.swift
//  SelectItemControllerSample
//
//  Created by keygx on 2019/09/29.
//  Copyright © 2019 keygx. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    lazy var appEventHandler = AppEventHandler()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            window = appEventHandler.createWindow(with: scene)
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        appEventHandler.didDisconnect()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        appEventHandler.didBecomeActive()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        appEventHandler.willResignActive()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        appEventHandler.willEnterForeground()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        appEventHandler.didEnterBackground()
    }
}

