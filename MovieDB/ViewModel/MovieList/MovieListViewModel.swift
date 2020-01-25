//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by William on 25/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol MovieListDelegate: class {
  func failedLoad(error: String)

  func successLoad(data: MovieModel)
}

final class MovieListViewModel {
  weak var delegate: MovieListDelegate?

  init(path: MoviePath) {
    Movies().listOfMovie(movie: path) { [weak self] (result) in
      switch result {
      case .failure(let error):
        self?.delegate?.failedLoad(error: error.localizedDescription)
      case .success(let data):
        let movieData = MovieModel(with: data)
        self?.delegate?.successLoad(data: movieData)
      }
    }
  }

}
