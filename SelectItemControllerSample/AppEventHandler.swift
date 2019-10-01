//
//  AppEventHandler.swift
//  SelectItemControllerSample
//
//  Created by keygx on 2019/09/29.
//  Copyright © 2019 keygx. All rights reserved.
//

import UIKit

final class AppEventHandler {
    
    @available(iOS 13.0, *)
    func createWindow(with windowScene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = UIColor.systemBackground
        configureRootViewController(for: window)
        return window
    }
    
    func createWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        configureRootViewController(for: window)
        return window
    }
    
    private func configureRootViewController(for window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        window.rootViewController = vc
    }
    
    func didDisconnect() {}

    func didBecomeActive() {}

    func willResignActive() {}

    func willEnterForeground() {}

    func didEnterBackground() {}
}
