//
//  Extensions.swift
//  Channels
//
//  Created by user on 3/24/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    class func setupAppearance() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .none
            appearance.titleTextAttributes = textAttributes
            appearance.largeTitleTextAttributes = textAttributes

            self.appearance().standardAppearance = appearance
            self.appearance().compactAppearance = appearance
            self.appearance().scrollEdgeAppearance = appearance
            self.appearance().tintColor = .white
            self.appearance().prefersLargeTitles = true
            
        } else {
            self.appearance().isTranslucent = false
            self.appearance().barTintColor = .darkGray
            self.appearance().tintColor = .white
            self.appearance().barStyle = .black

            self.appearance().titleTextAttributes = textAttributes
            if #available(iOS 11.0, *) {
                self.appearance().largeTitleTextAttributes = textAttributes
                self.appearance().prefersLargeTitles = true
            }
        }
    }
}
