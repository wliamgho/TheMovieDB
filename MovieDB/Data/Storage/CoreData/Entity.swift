//
//  Entity.swift
//  MovieDB
//
//  Created by William on 15/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import CoreData

protocol Entity {
  static func entityName() -> String
}
