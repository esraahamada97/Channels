//
//  DataSource.swift
//  Channels
//
//  Created by user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
class DataSource {
    
  static var shared = DataSource()
    
    var channels: [Channel] = []
    var eposides: [Media] = []
    var categories: [Category] = []
 
    func loadChannelDataFromJson() {
        
            if let path = Bundle.main.url(forResource: "Channels.Success", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: path, options: .alwaysMapped)
                    let jsonResult = try JSONDecoder().decode(FileResponse.self, from: data)
                    channels = jsonResult.data.channels ?? []
                   
                } catch let error {
                    print("parse error channel data: \(error)")
                    
                }

            } else {
                print("Invalid filename/path.")
                
            }

    }
    
    func loadEposidesDataFromJson() {
        
            if let path = Bundle.main.url(forResource: "Episodes.Success", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: path, options: .alwaysMapped)
                    let jsonResult = try JSONDecoder().decode(FileResponse.self, from: data)
                    eposides = jsonResult.data.media ?? []
                   
                } catch let error {
                    print("parse error eposides data: \(error)")
                    
                }

            } else {
                print("Invalid filename/path.")
                
            }

    }
    
    func loadCategoriesDataFromJson() {
        
            if let path = Bundle.main.url(forResource: "Category.Success", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: path, options: .alwaysMapped)
                    let jsonResult = try JSONDecoder().decode(FileResponse.self, from: data)
                    categories = jsonResult.data.categories ?? []
                } catch let error {
                    print("parse error eposides data: \(error)")
                    
                }

            } else {
                print("Invalid filename/path.")
                
            }

    }
    
}
