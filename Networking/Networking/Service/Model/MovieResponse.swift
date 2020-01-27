//
//  MovieResponse.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public class MoviesResponse: Codable {
  public let page: Int
  public let totalResults: Int
  public let totalPages: Int
  public let results: [MovieResult]
  public let dates: Dates?
  
  enum CodingKeys: String, CodingKey {
    case page, results, dates
    case totalResults = "totalResults"
    case totalPages = "totalPages"
  }
  
  // MARK: - Decode
  public required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.page = try container.decode(Int.self, forKey: .page)
    self.totalResults = try container.decode(Int.self, forKey: .totalResults)
    self.totalPages = try container.decode(Int.self, forKey: .totalPages)
    self.results = try container.decode([MovieResult].self, forKey: .results)
    self.dates = try container.decodeIfPresent(Dates.self, forKey: .dates)
  }
  
  // MARK: - Encode
  public func encode(to encode: Encoder) throws {
    var container = encode.container(keyedBy: CodingKeys.self)
    
    try container.encode(page, forKey: .page)
    try container.encode(totalResults, forKey: .totalResults)
    try container.encode(totalPages, forKey: .totalPages)
    try container.encode(results, forKey: .results)
    try container.encodeIfPresent(dates, forKey: .dates)
  }
}

public struct MovieResult: Codable {
  public let id: Int
  public let title: String
  public let originalLanguage: String
  public let originalTitle: String
  public let backdropPath: String?
  public let posterPath: String?
  public let overview: String
  public let releaseDate: String
  public let voteAverage: Double
  public let popularity: Double
  public let voteCount: Int
  public let tagline: String?
  public let genreIds: [Int]?
  public let credits: MovieCreditResponse?
  public let adult: Bool
  public let runtime: Int?
}

public struct MovieVideoResponse: Codable {
  public let id: Int
  public let results: [MovieVideo]
}

public struct MovieVideo: Codable {
  public let id: String
  public let key: String
  public let name: String
  public let site: String
  public let size: Int
  public let type: String
  
  public var youtubeURL: URL? {
    guard site == "YouTube" else {
      return nil
    }
    
    return URL(string: "https://www.youtube.com/watch?v=\(key)")
  }
}

public struct MovieCreditResponse: Codable {
  public let cast: [MovieCast]
  public let crew: [MovieCrew]
}

public struct MovieCast: Codable {
  public let character: String
  public let name: String
}

public struct MovieCrew: Codable {
  public let id: Int
  public let department: String
  public let job: String
  public let name: String
}

public struct Dates: Codable {
  public let maximum: String
  public let minimum: String
}
