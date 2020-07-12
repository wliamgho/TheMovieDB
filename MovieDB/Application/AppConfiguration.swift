//
//  AppConfiguration.swift
//  MovieDB
//
//  Created by William on 11/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

final class AppConfiguration {
  lazy var apiKey: String = {
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
      fatalError("ApiKey must not be empty in plist")
    }
    return apiKey
  }()

  lazy var apiBaseURL: String = {
    guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
      fatalError("ApiBaseURL must not be empty in plist")
    }
    return apiBaseURL
  }()

  lazy var imagesBaseURL: String = {
    guard let imageBaseURL = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String else {
      fatalError("ApiBaseURL must not be empty in plist")
    }
    return imageBaseURL
  }()
}
