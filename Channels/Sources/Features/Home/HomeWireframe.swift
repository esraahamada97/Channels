//
//  HomeWireframe.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import  UIKit

class HomeModule {

    class func createModule() -> UIViewController {

        let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let model = HomeModel()
        let presenter = HomePresenter(view: view, model: model)
        view.setPresenter(presenter: presenter)

        return view

    }
}
