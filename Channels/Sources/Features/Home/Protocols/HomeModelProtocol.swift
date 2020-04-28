//
//  HomeModelProtocol.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: BaseModelProtocol {
    func getChannelsFromDataSourse() -> [Channel]
    func getEposidesFromDataSourse() -> [Media]
    func getCategopriesFromDataSourse() -> [Category]
}
