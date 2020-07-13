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
  var queryParameter: [String : String] { get }
}

public struct ServiceConfigRequest: ServiceConfig {
  public let baseURL: URL
  public var headers: HTTPHeaders? = nil
  public var queryParameter: [String : String] = [:]

  init(baseURL: URL,
       headers: HTTPHeaders? = nil,
       queryParameter: [String : String] = [:]) {
    self.baseURL = baseURL
    self.headers = headers
    self.queryParameter = queryParameter
  }
}
