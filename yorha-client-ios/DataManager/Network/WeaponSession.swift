//
//  WeaponSession.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

class WeaponSession: WeaponRemoteDataProtocol {
    var interactor: WeaponInteractorProtocol?
    var presenter: WeaponPresenterProtocol?
    
    func retrieveWeapons() {
        let petition = request(endpoint: Endpoints.weapons)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                self.interactor?.onError()
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode([Weapon].self, from: data) {
                print("petition made to: \(petition) \nwith method: \(petition.httpMethod ?? "") \nwith data: \(jsonPetitions)")
                DispatchQueue.main.async {
                    self.interactor?.onDataRetrieved(data: jsonPetitions)
                }
            } else {
                self.interactor?.onError()
            }
            }.resume()
    }
    
    func retrieveOneWeapon(data: Weapon) {
        let petition = request(endpoint: Endpoints.weapons, id: data.ID)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode(Weapon.self, from: data) {
                print(jsonPetitions)
            } else {
                print("somenthing went wrong!")
            }
            }.resume()
    }
    
    func storeWeapon(data: Weapon) {
        guard let uploadData = try? JSONEncoder().encode(data) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.weapons, method: Methods.post)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Weapon stored!")
            }.resume()
    }
    
    func updateWeapon(data: Weapon) {
        guard let uploadData = try? JSONEncoder().encode(data) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.weapons, id: data.ID, method: Methods.put)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Weapon updated!")
            }.resume()
    }
    
    func deleteWeapon(data: Weapon) {
        let petition = request(endpoint: Endpoints.weapons, id: data.ID, method: Methods.delete)
        URLSession.shared.dataTask(with: petition){
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Weapon deleted!")
            }.resume()
    }
}

