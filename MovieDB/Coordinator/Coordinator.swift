//
//  Coordinator.swift
//  MovieDB
//
//  Created by William on 14/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

enum DeeplinkPath {
  case list
  case detail
}

protocol Coordinator: class {
  func start()

  func start(with option: DeeplinkPath?)
}
