//
//  DictionaryExtension.swift
//  MovieDB
//
//  Created by William on 13/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

extension Dictionary {
  // MARK: - Create query string
  var queryString: String {
      return self.map { "\($0.key)=\($0.value)" }
        .joined(separator: "&")
        .addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""
  }
}
