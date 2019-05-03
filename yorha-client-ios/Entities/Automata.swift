//
//  Automata+CoreData.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/28/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation
import CoreData

struct Automata: Codable {
    var ID: Int
    var Name: String
    var Occupation: String
    var Photo: String
    var RaceID: Int
    var Race: Race
}
