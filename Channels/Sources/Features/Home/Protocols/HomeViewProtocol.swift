//
//  HomeViewProtocol.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//
import Foundation

protocol HomeViewProtocol: BaseViewProtocol {
    func setEposides(eposides: [Media])
    func setChannels(channels: [Channel])
    func setCategories(categorieas: [Category])
}
