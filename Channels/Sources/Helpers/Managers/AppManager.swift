//
//  AppManager.swift
//  Channels
//
//  Created by user on 3/24/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

class AppManager: NSObject {
@objc static let shared: AppManager = AppManager()
   
   private(set) var window: UIWindow?
   
   static func launchApp(_ application: UIApplication) {
       
       if #available(iOS 13, *) {
           // use UICollectionViewCompositionalLayout
           //Scene Delegate will call  initWindow(windowScene: UIWindowScene)
           
       } else {
           // show sad face emoji
           initWindow()
       }
       
   }
   
   static func initWindow() {
       
       let window = UIWindow(frame: UIScreen.main.bounds)
       let vc = Container.getSplashScene()
       window.rootViewController = vc
       window.makeKeyAndVisible()
       self.shared.window = window
   }
   
   @available(iOS 13.0, *)
   static func initWindow(windowScene: UIWindowScene) {
       let window = UIWindow(windowScene: windowScene)
       let vc = Container.getSplashScene()
       window.rootViewController = vc
       window.makeKeyAndVisible()
       self.shared.window = window
   }
   
   func setWindowRoot(_ viewController: UIViewController) {
       self.window?.rootViewController = viewController
   }
}
