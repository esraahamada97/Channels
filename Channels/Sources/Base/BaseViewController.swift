//
//  BaseViewController.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseViewProtocol {
    
    func showLoading(allowNavigation: Bool) {
        fatalError("\(#function) Not Implemented")
    }

    func hideLoading() {
        fatalError("\(#function) Not Implemented")
    }

    func showError(message: String) {
        fatalError("\(#function) Not Implemented")
    }
}
