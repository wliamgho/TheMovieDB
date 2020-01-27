//
//  ServiceManager.swift
//  MovieDB
//
//  Created by William on 22/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
  case GET
  case POST
  case PUT
}

public typealias CompletionHandler = (Result<[String: Any], ServiceError>) -> Void

class ServiceManager {
  private let session: ServiceSession
  private static var header = ["Content-Type": "application/json"]

  init(session: ServiceSession = URLSession.shared) {
    self.session = session
  }

  func load(path: String, params: [String: String]? = [:], method: HTTPMethod,
            body: [String: Any]? = nil, completion: @escaping(Data?, ServiceError?) -> Void) {
    guard let baseUrl = URL(string: "https://api.themoviedb.org/3/\(path)"),
      var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: false) else { return }

    // Append query items
    var queryItems = [URLQueryItem(name: "api_key", value: "0340dd96e32f995c600b8deb3dffbfb4")]

    if let params = params {
      queryItems.append(contentsOf: params.map({ URLQueryItem(name: $0.key, value: $0.value)} ))
    }

    components.queryItems = queryItems

    guard let url = components.url else { return }
  
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    urlRequest.allHTTPHeaderFields = ServiceManager.header

    if let body = body {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    }

    session.load(url: urlRequest) { (data, response, error) in
      var serviceErrorType = ServiceErrorType.network

      // Check data is exist or nil
      guard let data = data, error == nil else {
        completion(nil, ServiceError(type: serviceErrorType))
        return
      }

      do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode != 200, httpResponse.statusCode != 201 {
          if let message = ((json as? [String: Any])?["errors"] as? [String])?.first {
            serviceErrorType = .err(message: message)
          } else {
            serviceErrorType = .err(message: "An unexpected error occured. Please try again")
          }

          completion(data, ServiceError(type: serviceErrorType))
          return
        }
        
        completion(data, nil)
      } catch {
        serviceErrorType = .invalid
        completion(nil, ServiceError(type: serviceErrorType))
      }
    }
    
  }
}
