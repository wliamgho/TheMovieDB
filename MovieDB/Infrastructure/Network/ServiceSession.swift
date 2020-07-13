//
//  ServiceSession.swift
//  MovieDB
//
//  Created by William on 11/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation
import Alamofire

public protocol ServiceSession {
  typealias CompletionHandler = (Result<Data?, ErrorResponse>) -> Void
  func request(endpoint: ResponseRequest, completion: @escaping CompletionHandler) -> DataRequest?
}

public protocol ServiceRequest {
  typealias CompletionHandler = (AFDataResponse<Data>) -> Void
  func request(config: ServiceConfig, endpoint: ResponseRequest, completion: @escaping CompletionHandler) -> DataRequest
}
