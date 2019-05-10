//
//  Boss.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

struct Boss: Codable {
    var ID: Int
    var Name: String
    var Faction: String
    var Zones: [Zone]
    var Photo: String
}
