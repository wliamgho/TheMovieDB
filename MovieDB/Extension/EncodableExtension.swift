//
//  EncodableExtension.swift
//  MovieDB
//
//  Created by William on 13/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

extension Encodable {
  // MARK: - Convert into dictionary
  func toDictionary() throws -> [String: Any]? {
    let data = try JSONEncoder().encode(self)
    let josnData = try JSONSerialization.jsonObject(with: data)
    return josnData as? [String : Any]
  }
}
