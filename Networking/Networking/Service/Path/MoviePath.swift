//
//  MoviePath.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public enum MoviePath {
  case nowPlaying
  case popular
  case topRated
  case upcoming
  case detail(movieID: Int)
  case video(movieID: Int)

  public var path: String {
    switch self {
    case .nowPlaying:
      return "movie/now_playing"
    case .popular:
      return "movie/popular"
    case .topRated:
      return "movie/top_rated"
    case .upcoming:
      return "movie/upcoming"
    case .detail(let movieID):
      return "movie/\(movieID)"
    case .video(let movieID):
      return "movie/\(movieID)/videos"
    }
  }

  // path is equal
  static func == (lhs: MoviePath?, rhs: MoviePath) -> Bool {
    guard let lhs = lhs else { return false }

    return lhs == lhs
  }
}
