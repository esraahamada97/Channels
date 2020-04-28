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
  private let decoder = JSONDecoder()
    
    func loadDataFromJson() {
        
            if let path = Bundle.main.url(forResource: "Channels.Success", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: path, options: .alwaysMapped)
                    let jsonResult = try JSONDecoder().decode(FileResponse.self, from: data)
                    channels = jsonResult.data.channels ?? []
                   
                } catch let error {
                    print("parse error data: \(error)")
                    
                }

            } else {
                print("Invalid filename/path.")
                
            }

    }
}
