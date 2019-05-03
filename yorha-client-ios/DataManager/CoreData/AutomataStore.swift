//
//  AutomataStore.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import CoreData

class AutomataStore: AutomataLocalDataProtocol {
    
    func retrieveAutomatas() throws -> [AutomataCD]  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<AutomataCD> = NSFetchRequest(entityName: String(describing: AutomataCD.self))
        
        return try managedOC.fetch(request)
    }
    
    func storeAutomata(
            id: Int32, name: String, occupation: String, photo: String, raceID: Int32, raceName: String
        ) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newAutomata = NSEntityDescription.entity(forEntityName: String(describing: AutomataCD.self), in: managedOC) {
            let automata = AutomataCD(entity: newAutomata, insertInto: managedOC)
            automata.id = Int32(id)
            automata.name = name
            automata.occupation = occupation
            automata.photo = photo
            automata.raceID = Int32(raceID)
            automata.race?.id = Int32(raceID)
            automata.race?.name = raceName
            try managedOC.save()
        }
        
        throw PersistenceError.couldNotSaveObject
    }
}

