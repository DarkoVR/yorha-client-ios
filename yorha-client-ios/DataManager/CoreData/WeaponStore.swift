//
//  WeaponStore.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import CoreData

class WeaponStore: WeaponLocalDataProtocol {
    
    func retrieveWeapons() throws -> [WeaponCD]  {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<WeaponCD> = NSFetchRequest(entityName: String(describing: WeaponCD.self))
        
        return try managedOC.fetch(request)
    }
    
    func storeWeapon(
        id: Int32, name: String, minAttack: Int32, maxAttack: Int32, ability: String, photo: String, classID: Int32, className: String
        ) throws {
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newWeapon = NSEntityDescription.entity(forEntityName: String(describing: WeaponCD.self), in: managedOC) {
            let Weapon = WeaponCD(entity: newWeapon, insertInto: managedOC)
            Weapon.id = id
            Weapon.name = name
            Weapon.minAttack = minAttack
            Weapon.maxAttack = maxAttack
            Weapon.ability = ability
            Weapon.photo = photo
            Weapon.classID = classID
            Weapon.weaponClass?.id = classID
            Weapon.weaponClass?.name = className
            try managedOC.save()
        }
        
        throw PersistenceError.couldNotSaveObject
    }
}

