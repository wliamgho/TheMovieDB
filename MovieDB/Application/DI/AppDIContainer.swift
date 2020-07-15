//
//  AppDIContainer.swift
//  MovieDB
//
//  Created by William on 14/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class AppDIContainer {
  lazy var configuration = AppConfiguration()

  lazy var responseData: DataService = {
    let baseURL = URL(string: AppConfiguration().apiBaseURL)
    let params = ["api_key": AppConfiguration().apiKey,
                  "language": Locale.current.languageCode ?? "en"]
    let config = ServiceConfigRequest(baseURL: baseURL!, queryParameter: params)
    let session = ServiceManager(config: config)
    return ServiceResponse(session: session)
  }()

  lazy var imageResponse: DataService = {
    let baseURL = URL(string: AppConfiguration().imagesBaseURL)
    let config = ServiceConfigRequest(baseURL: baseURL!)
    let session = ServiceManager(config: config)
    return ServiceResponse(session: session)
  }()

  func makeMovieDIContainer() {
  }
}
