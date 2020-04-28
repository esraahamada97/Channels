//
//  Media.swift
//  Channels
//
//  Created by user on 4/28/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

final class Media: NSObject, Codable {
    let type, title: String
    let coverAsset: CoverAsset
    let channel: Channel
}
