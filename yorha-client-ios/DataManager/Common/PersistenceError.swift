//
//  PersistenceErrors.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/27/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
