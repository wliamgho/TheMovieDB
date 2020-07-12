//
//  ServiceError.swift
//  MovieDB
//
//  Created by William on 11/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

public enum ErrorResponse: Error {
  case error(statusCode: Int, data: Data?)
  case noConnection
  case invalidUrl
  case base(Error)
}

public enum DataTransferError: Error {
  case noResponse
  case invalidNetwork(ErrorResponse)
  case parsing(Error)
  case connectionError(Error)
}

public protocol DataError {
  func err(error: ErrorResponse) -> Error
}

public final class ServiceResponseError: DataError {
  public init() {}

  public func err(error: ErrorResponse) -> Error {
    return error
  }
}
