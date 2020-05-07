//
//  NsObject+ListDiffable.swift
//  Channels
//
//  Created by user on 4/28/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import IGListKit

extension NSObject: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return true
  }
}
