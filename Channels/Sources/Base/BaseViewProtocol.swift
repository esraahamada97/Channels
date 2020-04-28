//
//  BaseView.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol BaseViewProtocol {
    
    func showLoading(allowNavigation: Bool)

    func hideLoading()

    func showError(message: String)
}
