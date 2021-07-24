//
//  PopularMovieViewModelIO.swift
//  TheMovieDB
//
//  Created by William on 13/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import Foundation

protocol PopularMovieViewModelInput: AnyObject {}

protocol PopularMovieViewModelOutput: AnyObject {}

protocol PopularMovieViewModel: PopularMovieViewModelInput & PopularMovieViewModelOutput {}
