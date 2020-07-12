//
//  APIEndpoints.swift
//  MovieDB
//
//  Created by William on 12/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

struct APIEndpoints {
  static func getMovie() -> Endpoint<MoviesResponseDTO> {
    return Endpoint(path: "/movie/latest",
                    method: .get,
                    queryParams: ["api_key": AppConfiguration().apiKey])
  }
}

struct MoviesResponseDTO: Codable {
  let id: Int
  let title: String
}
