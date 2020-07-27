//
//  HomePresenterProtocol.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import IGListKit

protocol HomePresenterProtocol: BasePresenterProtocol {
    func loadEposides()
    func loadChannels()
    func loadCategories()
}
