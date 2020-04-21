//
//  Channels.swift
//  Channels
//
//  Created by user on 4/21/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
struct Channel: Hashable {
    var title: String = "The Cure For Loneliness"
    var subTitle: String = "The Cure For Loneliness"
    var imageUrl: String = ""
    
    init(title: String, subTitle: String, imageUrl: String) {
        self.title = title
        self.subTitle = subTitle
        self.imageUrl = imageUrl
    }
    func hash(into hasher: inout Hasher) {
       hasher.combine(identifier)
     }

     static func == (lhs: Channel, rhs: Channel) -> Bool {
       return lhs.identifier == rhs.identifier
     }

     private let identifier = UUID()
}
