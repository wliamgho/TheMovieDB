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
  var isFullPath: Bool { get }
  var method: HTTPMethod { get }
  var queryParams: [String: String] { get }
  var queryParamsEncodable: Encodable? { get }

  func urlRequest(config: ServiceConfig) throws -> URL
}

public protocol ResponseRequestable: Request {
  associatedtype Response

  var responseDecoder: DataResponse { get }
}

// Endpoint
public class Endpoint<R>: ResponseRequestable {
  public typealias Response = R

  public var path: String
  public var isFullPath: Bool
  public var method: HTTPMethod
  public var queryParams: [String : String] = [:]
  public var queryParamsEncodable: Encodable? = nil
  public var responseDecoder: DataResponse

  init(path: String,
       isFullPath: Bool = false,
       method: HTTPMethod,
       queryParams: [String: String] = [:],
       queryParamsEncodable: Encodable? = nil,
       responseDecoder: DataResponse = JSONResponseDecoder()) {
    self.path = path
    self.isFullPath = isFullPath
    self.method = method
    self.queryParams = queryParams
    self.queryParamsEncodable = queryParamsEncodable
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

enum RequestGenerationError: Error {
  case urlComponent
}

extension Endpoint {
  public func convertedURL(config: ServiceConfig) throws -> URL {
    let baseURL = config.baseURL.absoluteString
    let endpoint = isFullPath ? path : baseURL.appending(path)

    guard var urlComponents = URLComponents(string: endpoint) else {
      throw RequestGenerationError.urlComponent
    }

    var urlQueryItems = [URLQueryItem]()

    config.queryParameter.forEach {
      urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
    }
    urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
    guard let url = urlComponents.url else { throw RequestGenerationError.urlComponent }
    return url
  }

  public func urlRequest(config: ServiceConfig) throws -> URL {
    return try self.convertedURL(config: config)
  }
}
