//
//  Container.swift
//  Channels
//
//  Created by user on 3/24/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

class Container {
    class func getHomeScene() -> UIViewController {
        return HomeModule.createModule()
       }
    class func getSplashScene() -> UIViewController {
        return SplashViewController()
    }
    
    class func getFontScene() -> UIViewController {
        return FontViewController()
    }
}
