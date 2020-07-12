//
//  ServiceConfig.swift
//  MovieDB
//
//  Created by William on 11/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation
import Alamofire

public protocol ServiceConfig {
  var baseURL: URL { get }
  var headers: HTTPHeaders? { get }
  var parameters: [String : String] { get }
}

final class ServiceConfigRequest: ServiceConfig {
  public let baseURL: URL
  var headers: HTTPHeaders? = nil
  var parameters: [String : String] = [:]

  init(baseURL: URL,
       headers: HTTPHeaders? = nil,
       parameters: [String : String] = [:]) {
    self.baseURL = baseURL
    self.headers = headers
    self.parameters = parameters
  }
}
