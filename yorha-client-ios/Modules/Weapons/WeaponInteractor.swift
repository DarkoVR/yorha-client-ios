//
//  WeaponInteractor.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponInteractor: WeaponInteractorProtocol {
    weak var presenter: WeaponPresenterProtocol?
    var remoteData: WeaponRemoteDataProtocol?
    var localData: WeaponLocalDataProtocol?
    
    func onError() {
        presenter?.onError()
    }
    
    func retrieveData() {
        do {
            if let data = try localData?.retrieveWeapons() {
                let WeaponList = data.map() {
                    return Weapon(
                        ID: Int($0.id),
                        Name: $0.name!,
                        MinAttack: Int($0.minAttack),
                        MaxAttack: Int($0.maxAttack),
                        Ability: $0.ability!,
                        Photo: $0.photo!,
                        ClassID: Int($0.classID),
                        Class: Class(
                            ID: Int($0.classID),
                            Name: $0.weaponClass?.name
                        )
                    )
                }
                
                if (presenter?.isInternetConnected())! || WeaponList.isEmpty {
                    remoteData?.retrieveWeapons()
                }else{
                    print("Local data for Weapons retrieved")
                    presenter?.didRetrieveData(data: WeaponList)
                }
            } else {
                remoteData?.retrieveWeapons()
            }
            
        } catch {
            presenter?.didRetrieveData(data: [])
        }
    }
    
    func onPostsRetrieved(_ data: [Weapon]) {
        presenter?.didRetrieveData(data: data)
        
        for Weapon in data {
            do {
                try localData?.storeWeapon(
                    id: Int32(Weapon.ID),
                    name: Weapon.Name,
                    minAttack: Int32(Weapon.MinAttack),
                    maxAttack: Int32(Weapon.MaxAttack),
                    ability: Weapon.Ability,
                    photo: Weapon.Photo,
                    classID: Int32(Weapon.ClassID),
                    className: Weapon.Class.Name!
                )
            } catch {
                
            }
        }
    }
}
