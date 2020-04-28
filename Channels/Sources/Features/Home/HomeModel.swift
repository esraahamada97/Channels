//
//  HomeModel.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class HomeModel: BaseModel, HomeModelProtocol {
    func getChannelsFromDataSourse() -> [Channel] {
       DataSource.shared.loadChannelDataFromJson()
        return DataSource.shared.channels
    }
    
    func getEposidesFromDataSourse() -> [Media] {
        DataSource.shared.loadEposidesDataFromJson()
        return DataSource.shared.eposides
    }
    
    func getCategopriesFromDataSourse() -> [Category] {
        DataSource.shared.loadCategoriesDataFromJson()
        return DataSource.shared.categories
    }
    
}
