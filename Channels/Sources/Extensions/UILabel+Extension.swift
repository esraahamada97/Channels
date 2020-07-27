//
//  UILabel+Extension.swift
//  Channels
//
//  Created by Esraa Abuseada on 7/27/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
   @objc var substituteFontName: String {
        get { return self.font.fontName }
        set {
            if self.font.fontName.range(of: "-Bd") == nil {
                self.font = UIFont(name: newValue, size: self.font.pointSize + 3)
            }
        }
    }
    
    @objc var substituteFontNameBold: String {
        get { return self.font.fontName }
        set {
            if self.font.fontName.range(of: "-Bd") != nil {
                self.font = UIFont(name: newValue, size: self.font.pointSize + 3)
            }
        }
    }
}

extension UIFont {
    class func appRegularFontWith( size: CGFloat ) -> UIFont {
        return  UIFont(name: "Arial-BoldMT", size: size) ?? UIFont()
    }
    class func appBoldFontWith( size: CGFloat ) -> UIFont {
        return  UIFont(name: "Arial-BoldMT", size: size) ?? UIFont()
    }
}
