//
//  Series.swift
//  Channels
//
//  Created by user on 4/28/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

final class Series: NSObject, Codable {
    let title: String
    let coverAsset: CoverAsset
    let id: String?
}
