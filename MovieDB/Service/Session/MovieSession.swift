//
//  MovieSession.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

open class Movies {
  public init() {}
  
  /// List of movies based on status ( Now Playing, Popular, Top Rated, Upcoming )
  /// - Parameter movie: Movie status
  /// - Parameter page (optional): Movie list of page, by default page is `1`
  /// - Parameter language (optional): Movie language description, by default language is `en-US`
  /// - Parameter completion: Movie response contains success and failed (error)
  func listOfMovie(movie: MoviePath, page: String = "1", language: String = "en-US",
                        completion: @escaping CompletionHandler) {
    let param: [String: String] = ["language": language, "page": page]
    
    ServiceManager().load(path: movie.path, params: param, method: .GET, body: nil) { (data, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let data = data else { return }
      
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      
      do {
        let movieResponse = try decoder.decode(MoviesResponse.self, from: data)
        
        if let dict = movieResponse.dictionary {
          completion(.success(dict))
        }
        
      } catch {
        completion(.failure(ServiceError(type: .invalid)))
      }
    }
  }

}
