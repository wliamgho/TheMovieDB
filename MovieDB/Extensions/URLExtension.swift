//
//  URLExtension.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

extension URL {
  func appending(_ path: String? = "", queryItems: [String: String], value: String) -> URL? {
    var urlComponents = URLComponents(string: value)
    if let urlPath = path {
      urlComponents?.path = "/3/\(urlPath)"
    }
    
    var items: [URLQueryItem] = urlComponents?.queryItems ?? []
    var queryItem: URLQueryItem!
    
    for item in queryItems {
      queryItem = URLQueryItem(name: item.key, value: item.value)
      items.append(queryItem)
    }
    
    urlComponents?.queryItems = items
    
    return urlComponents?.url
  }
}
