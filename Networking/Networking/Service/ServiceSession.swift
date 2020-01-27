//
//  ServiceSession.swift
//  MovieDB
//
//  Created by William on 22/01/20.
//  Copyright © 2020 William. All rights reserved.
//

import Foundation

protocol ServiceSession {
  func load(url: URLRequest, completion: @escaping(Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: ServiceSession {
  func load(url: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        completion(data, response, error)
      }
    }

    task.resume()
  }
}
