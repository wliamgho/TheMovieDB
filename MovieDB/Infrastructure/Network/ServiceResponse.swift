//
//  ServiceRespond.swift
//  MovieDB
//
//  Created by William on 12/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation
import Alamofire

public protocol ResponseDecoder {
  func decode<T: Decodable>(_ data: Data) throws -> T
}


public protocol DataService {
  typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void

  @discardableResult
  func request<T: Decodable, E: ResponseRequestable>(withEndpoint endpoint: E,
                                                 completion: @escaping CompletionHandler<T>) -> DataRequest? where E.Response == T
}

public final class ServiceResponse {
  private let session: ServiceSession
  private let errorResponse: DataError

  init(session: ServiceSession, errorResponse: DataError = ServiceResponseError()) {
    self.session = session
    self.errorResponse = errorResponse
  }

  // MARK: - Private methods
  private func decode<T: Decodable>(data: Data?, decoder: DataResponse) -> Result<T, DataTransferError> {
    do {
      guard let data = data else { return .failure(.noResponse) }
      let result: T = try decoder.decode(data)
      return .success(result)
    } catch {
      return .failure(.parsing(error))
    }
  }

  private func convertedError(error: ErrorResponse) -> DataTransferError {
    let err = self.errorResponse.err(error: error)
    return err is ErrorResponse ? .invalidNetwork(error) : .connectionError(err)
  }
}

extension ServiceResponse: DataService {
  public func request<T, E>(withEndpoint endpoint: E,
                            completion: @escaping CompletionHandler<T>) -> DataRequest? where T : Decodable, T == E.Response, E : ResponseRequestable {
    return self.session.request(endpoint: endpoint) { (response) in
      switch response {
      case .success(let data):
        let result: Result<T, DataTransferError> = self.decode(data: data, decoder: endpoint.responseDecoder)
        return completion(result)
      case .failure(let error):
        print("ERROR SERVICE RESPONSE", error)
        let err = self.convertedError(error: error)
        return completion(.failure(err))
      }
    }
  }
}
