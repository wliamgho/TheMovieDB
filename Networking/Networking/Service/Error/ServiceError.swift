//
//  ServiceError.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

enum ServiceErrorType: Error, Equatable {
  case err(message: String)
  case network
  case invalid
  case unexpected
}

public struct ServiceError: Error, Equatable {
  let type: ServiceErrorType
  
  var message: String {
    switch type {
    case .err(let message):
      return message
    case .network:
      return "An Error occurred during connection. Please try again."
    case .invalid:
      return "Invalid respond"
    case .unexpected:
      return "An unexpected error occured. Please try again"
    }
  }
}
