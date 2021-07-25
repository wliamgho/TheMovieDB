//
//  MockNetworkSession.swift
//  TheMovieDBTests
//
//  Created by William on 25/07/21.
//  Copyright © 2021 william. All rights reserved.
//

import XCTest
import Alamofire

@testable import TheMovieDB

class MockNetworkSession: SessionRequest {
    var invokedDataRequest = false
    var invokedDataRequestCount = 0
    var invokedDataRequestParameters: (urlRequest: URLRequestConvertible, Void)?
    var invokedDataRequestParametersList = [(urlRequest: URLRequestConvertible, Void)]()
    var stubbedDataRequestResult: DataRequest!

    func dataRequest(urlRequest: URLRequestConvertible) -> DataRequest {
        invokedDataRequest = true
        invokedDataRequestCount += 1
        invokedDataRequestParameters = (urlRequest, ())
        invokedDataRequestParametersList.append((urlRequest, ()))
        return stubbedDataRequestResult
    }
}
