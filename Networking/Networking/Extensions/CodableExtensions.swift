//
//  CodableExtensions.swift
//  MovieDB
//
//  Created by William on 23/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }

    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap({ $0 as? [String: Any] })
  }
}
