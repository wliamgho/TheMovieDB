//
//  MockServiceRequest.swift
//  MovieDBTests
//
//  Created by William on 12/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import Alamofire

@testable import MovieDB
class MockServiceRequest: ServiceRequest {
  func request(config: ServiceConfig, endpoint: ResponseRequest, completion: @escaping CompletionHandler) -> DataRequest {
    let request = AF.request("https://tests.com",
                             method: .get,
                             parameters: ["api_key": "asdfasdfa"],
                             encoder: URLEncodedFormParameterEncoder.default,
                             headers: nil)
    request.responseData { (response) in
      completion(response)
    }
    return request
  }
}
