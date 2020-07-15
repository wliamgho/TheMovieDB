//
//  Authentication.swift
//  MovieDB
//
//  Created by William on 15/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import CoreData

protocol AuthenticationData {
  func fetchAuthenticationData(completion: @escaping (Result<[AuthenticationModel], Error>) -> Void)
}

final class AuthenticationStorage: AuthenticationData {
  private let coreData: MovieDBCoreData

  init(coreData: MovieDBCoreData = MovieDBCoreData.shared) {
    self.coreData = coreData
  }

  func fetchAuthenticationData(completion: @escaping (Result<[AuthenticationModel], Error>) -> Void) {
    coreData.performBackgroundTask { (context) in
      do {
        let request: NSFetchRequest = AuthenticationEntity.fetchRequest()
        let result = try context.fetch(request).map({ $0.toDomain() })
        completion(.success(result))
      } catch {
        completion(.failure(CoreDataError.readError(error)))
      }
    }
  }
}

