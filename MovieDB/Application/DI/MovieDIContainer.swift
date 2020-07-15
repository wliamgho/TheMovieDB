//
//  MovieDIContainer.swift
//  MovieDB
//
//  Created by William on 15/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import UIKit

struct Dependencies {
  let service: DataTransferService
  let imageService: DataTransferService
}

final class MovieDIContainer {
  private let dependencies: Dependencies

  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
}
