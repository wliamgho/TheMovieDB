//
//  MockServiceConfig.swift
//  MovieDBTests
//
//  Created by William on 12/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import XCTest
import Alamofire

@testable import MovieDB
class MockServiceConfig: ServiceConfig {
  var baseURL: URL = URL(string: "https://test.com")!
  var headers: HTTPHeaders? = nil
  var queryParameter: [String : String] = [:]
}
