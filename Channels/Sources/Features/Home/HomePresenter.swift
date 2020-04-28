//
//  HomePresenter.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class HomePresenter<View: HomeViewProtocol, Model: HomeModelProtocol>:
BasePresenter<View, Model>, HomePresenterProtocol {
    
    private var view: View?
    private var model: Model?

}
