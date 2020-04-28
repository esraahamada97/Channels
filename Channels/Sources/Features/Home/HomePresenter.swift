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
    
    override init(view: View, model: Model) {
        self.model = model
        self.view = view
        super.init(view: view, model: model)
    }
    func loadChannels() {
        guard let channels = model?.getChannelsFromDataSourse() else {
            print("channels are not loaded in presenter")
            return
        }
        view?.setChannels(channels: channels )
    }
    
    func loadEposides() {
        guard let eposides = model?.getEposidesFromDataSourse() else {
        print("eposides are not loaded in presenter")
        return
        }
        view?.setEposides(eposides: eposides)
    }
    
    func loadCategories() {
         guard let categories = model?.getCategopriesFromDataSourse() else {
               print("categories are not loaded in presenter")
               return
               }
        view?.setCategories(categorieas: categories)
    }
    
}
