//
//  PodProgramStore.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import CoreData

class PodProgramStore: PodProgramLocalDataProtocol {
    
    func retrievePodPrograms() throws -> [PodProgramCD]  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<PodProgramCD> = NSFetchRequest(entityName: String(describing: PodProgramCD.self))
        
        return try managedOC.fetch(request)
    }
    
    func storePodProgram(
        id: Int32, name: String, program: String, cooldown: Int32, photo: String
        ) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPodProgram = NSEntityDescription.entity(forEntityName: String(describing: PodProgramCD.self), in: managedOC) {
            let PodProgram = PodProgramCD(entity: newPodProgram, insertInto: managedOC)
            PodProgram.id = id
            PodProgram.name = name
            PodProgram.program = program
            PodProgram.cooldown = cooldown
            PodProgram.photo = photo
            try managedOC.save()
        }
        
        throw PersistenceError.couldNotSaveObject
    }
}

