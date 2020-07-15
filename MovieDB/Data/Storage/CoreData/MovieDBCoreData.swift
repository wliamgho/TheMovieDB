//
//  MovieDBCoreData.swift
//  MovieDB
//
//  Created by William on 15/07/20.
//  Copyright © 2020 William. All rights reserved.
//

import CoreData

enum CoreDataError: Error {
  case readError(Error)
  case saveError(Error)
  case deleteError(Error)
}

final class MovieDBCoreData {
  static let shared = MovieDBCoreData()

  // MARK: - Core Data Stack
  private lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "MovieDB")
    container.loadPersistentStores { (_, error) in
      if let err = error {
        print("Invalid load persistent stores: ",err.localizedDescription)
        return
      }
    }
    return container
  }()

  // MARK: - Fetch Data
  func fetch<T: Entity>(of type: T.Type, with predicate: NSPredicate? = nil) -> [T] {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityName())
    request.returnsObjectsAsFaults = false
    request.predicate = predicate

    var entities = [T]()
  
    do {
      let fetchResult = try persistentContainer.viewContext.fetch(request)

      for data in fetchResult {
        if let entity = data as? T {
          entities.append(entity)
        }
      }
    } catch {
      debugPrint("Error when fetching")
    }

    return entities
  }

  // MARK: - Save
  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        print("Invalid save context", error.localizedDescription)
      }
    }
  }

  func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
    persistentContainer.performBackgroundTask(block)
  }
}
