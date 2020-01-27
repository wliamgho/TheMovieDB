//
//  MovieModel.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

struct MovieModel {
  var page: Int = 0
  var totalPages: Int = 0
  var movies: [Movie] = []
  
  init(with dictionary: Dictionary<String, Any>) {
    if let page = dictionary["page"] as? Int {
      self.page = page
    }
    if let totalPages = dictionary["totalPages"] as? Int {
      self.totalPages = totalPages
    }
    if let movies = dictionary["results"] as? [[String: Any]] {
      for movie in movies {
        let movie = Movie(with: movie)
        self.movies.append(movie)
      }
    }
  }
}

typealias MovieId = String

struct Movie {
  var id: Int = 0
  var title: String = ""
  var posterPath: String = ""
  var backdropPath: String = ""
  var overview: String = ""
  var releaseDate: String = ""
  var voteAverage: String = ""
  
  init(with dictionary: Dictionary<String, Any>) {
    if let id = dictionary["id"] as? Int {
      self.id = id
    }
    if let title = dictionary["title"] as? String {
      self.title = title
    }
    if let posterPath = dictionary["posterPath"] as? String {
      self.posterPath = "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    if let backdropPath = dictionary["backdropPath"] as? String {
      self.backdropPath = "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
    if let overview = dictionary["overview"] as? String {
      self.overview = overview
    }
    if let releaseDate = dictionary["releaseDate"] as? String {
      self.releaseDate = releaseDate
    }
    if let voteAverage = dictionary["voteAverage"] as? Double {
      self.voteAverage = "\(Int((voteAverage) * 10))%"
    }
  }
}

extension Movie: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
