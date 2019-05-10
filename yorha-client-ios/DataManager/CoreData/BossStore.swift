//
//  BossStore.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import CoreData

class BossStore: BossLocalDataProtocol {
    
    func retrieveBosses() throws -> [BossCD]  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<BossCD> = NSFetchRequest(entityName: String(describing: BossCD.self))
        
        return try managedOC.fetch(request)
    }
    
    func storeBoss(
        id: Int32, name: String, faction: String, photo: String, zones: [Zone]
        ) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let bossDescription = NSEntityDescription.entity(forEntityName: String(describing: BossCD.self), in: managedOC) {
            let newBoss = BossCD(entity: bossDescription, insertInto: managedOC)
            newBoss.id = Int32(id)
            newBoss.name = name
            newBoss.faction = faction
            newBoss.photo = photo
            //var zonesList = [ZoneCD]()
            for item in zones {
                if let zoneDescription = NSEntityDescription.entity(forEntityName: String(describing: ZoneCD.self), in: managedOC) {
                    let newZone = ZoneCD(entity: zoneDescription, insertInto: managedOC)
                    newZone.id = Int32(item.ID)
                    newZone.name = item.Name
                    newZone.bossID = Int32(item.BossID)
                    //zonesList.append(newZone)
                    newBoss.zones?.append(newZone)
                }
            }
            //newBoss.zones = zonesList
            try managedOC.save()
        }
        
        throw PersistenceError.couldNotSaveObject
    }
}


