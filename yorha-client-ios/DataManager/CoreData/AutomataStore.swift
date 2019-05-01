//
//  AutomataStore.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import CoreData

class AutomataStore {
    
    func retrieveAutomatas() throws -> [AutomataCD]  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<AutomataCD> = NSFetchRequest(entityName: String(describing: AutomataCD.self))
        
        return try managedOC.fetch(request)
    }
    
    func storeAutomata(automataCD: AutomataCD) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newAutomata = NSEntityDescription.entity(forEntityName: String(describing: AutomataCD.self), in: managedOC) {
            let automata = AutomataCD(entity: newAutomata, insertInto: managedOC)
            automata.ID = Int32(automataCD.ID)
            automata.Name = automataCD.Name
            automata.Occupation = automataCD.Occupation
            automata.Photo = automataCD.Photo
            automata.RaceID = Int32(automataCD.RaceID)
            automata.Race = automataCD.Race
            try managedOC.save()
        }
        
        throw PersistenceError.couldNotSaveObject
    }
}

