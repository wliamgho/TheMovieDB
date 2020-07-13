//
//  ServiceManager.swift
//  MovieDB
//
//  Created by William on 11/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Alamofire

public protocol DataResponse {
  func decode<T: Decodable>(_ data: Data) throws -> T
}

protocol DataTransferService {
  typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void

  @discardableResult
  func request<E: ResponseRequestable>(withEndpoint endpoint: E,
                                       completion: @escaping CompletionHandler<Void>) -> DataRequest? where E.Response == Void
}

final class ServiceManager {
  private let config: ServiceConfig

  public init(config: ServiceConfig) {
    self.config = config
  }

  private func convertedErrorRequest(error: AFError) -> ErrorResponse {
    let code = URLError.Code(rawValue: (error as NSError).code)
    switch code {
    case .notConnectedToInternet: return .noConnection
    case .badURL: return .invalidUrl
    default:
      return .base(error)
    }
  }

  // MARK: - Load sesion request
  private func load(url: URL, endpoint: ResponseRequest, completion: @escaping CompletionHandler) -> DataRequest {
    let service = AF.request(url,
                             method: endpoint.method,
                             parameters: endpoint.queryParams,
                             encoding: URLEncoding.queryString,
                             headers: config.headers)
    service.responseData { (response) in
      switch response.result {
      case .success(let data):
        completion(.success(data))
      case .failure(let error):
        var err: ErrorResponse
        
        if let statusCode = error.responseCode {
          err = .error(statusCode: statusCode, data: response.data)
        } else {
          err = self.convertedErrorRequest(error: error)
        }
        completion(.failure(err))
      }
    }
    return service
  }
}

extension ServiceManager: ServiceSession {
  func request(endpoint: ResponseRequest, completion: @escaping CompletionHandler) -> DataRequest? {
    do {
      let url = try endpoint.urlRequest(config: config)
      return self.load(url: url, endpoint: endpoint, completion: completion)
    } catch {
      completion(.failure(.invalidUrl))
      return nil
    }
  }
}
