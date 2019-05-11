//
//  Weapon.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

struct Weapon: Codable {
    var ID: Int
    var Name: String
    var MinAttack: Int
    var MaxAttack: Int
    var Ability: String
    var Photo: String
    var ClassID: Int
    var Class: Class
}
