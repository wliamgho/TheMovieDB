//
//  Endpoint.swift
//  MovieDB
//
//  Created by William on 11/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation
import Alamofire


public protocol Request {
  var path: String { get }
  var method: HTTPMethod { get }
  var queryParams: [String: String] { get }
}

public protocol ResponseRequestable: Request {
  associatedtype Response
  
  var responseDecoder: DataResponse { get }
}

// Endpoint
public class Endpoint<R>: ResponseRequestable {
  public typealias Response = R

  public var path: String
  public var method: HTTPMethod
  public var queryParams: [String : String] = [:]
  public var responseDecoder: DataResponse

  init(path: String,
       method: HTTPMethod,
       queryParams: [String: String] = [:],
       queryParamEncodable: Encodable? = nil,
       responseDecoder: DataResponse = JSONResponseDecoder()) {
    self.path = path
    self.method = method
    self.queryParams = queryParams
    self.responseDecoder = responseDecoder
  }
}

// Decode response
public class JSONResponseDecoder: DataResponse {
  private let decoder = JSONDecoder()
  public init() {}

  public func decode<T>(_ data: Data) throws -> T where T : Decodable {
    return try decoder.decode(T.self, from: data)
  }
}
