//
//  MovieListModule.swift
//  MovieList
//
//  Created by William on 27/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import ModuleManager
import UIKit

public class MovieListModule: MovieListModuleManageable {
  public init() {}
  
  public func movieListVC() -> UIViewController {
    let bundle = Bundle(for: MovieListModule.self)
    return MovieListViewController(nibName: "MovieListViewController", bundle: bundle)
  }
}
 
