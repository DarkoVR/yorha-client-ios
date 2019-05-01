//
//  Automata+CoreData.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/28/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation
import CoreData

//Model for remote controller
struct Automata: Codable {
    var ID: Int
    var Name: String
    var Occupation: String
    var Photo: String
    var RaceID: Int
    var Race: Race
}

//Model for local controller
public class AutomataCD: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<AutomataCD> {
        return NSFetchRequest<AutomataCD>(entityName: "AutomataCD");
    }
    
    @NSManaged public var ID: Int32
    @NSManaged public var Name: String?
    @NSManaged public var Occupation: String?
    @NSManaged public var Photo: String?
    @NSManaged public var RaceID: Int32
    @NSManaged public var Race: RaceCD?
}
