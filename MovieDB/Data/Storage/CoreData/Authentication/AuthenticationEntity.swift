//
//  AuthenticationEntity.swift
//  MovieDB
//
//  Created by William on 15/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import CoreData

extension AuthenticationEntity {
  convenience init(context: NSManagedObjectContext) {
    self.init(context: context)
  }

  func toDomain() -> AuthenticationModel {
    return .init(username: username ?? "")
  }
}
