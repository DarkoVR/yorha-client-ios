//
//  BossSession.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/8/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

class BossSession: BossRemoteDataProtocol {
    var interactor: BossInteractorProtocol?
    var presenter: BossPresenterProtocol?
    
    func retrieveBosses() {
        let petition = request(endpoint: Endpoints.bosses)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                self.interactor?.onError()
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode([Boss].self, from: data) {
                print("petition made to: \(petition) \nwith method: \(petition.httpMethod ?? "") \nwith data: \(jsonPetitions)")
                DispatchQueue.main.async {
                    self.interactor?.onPostsRetrieved(jsonPetitions)
                }
            } else {
                self.interactor?.onError()
            }
            }.resume()
    }
    
    func retrieveOneBoss(data: Boss) {
        let petition = request(endpoint: Endpoints.bosses, id: data.ID)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode(Boss.self, from: data) {
                print(jsonPetitions)
            } else {
                print("somenthing went wrong!")
            }
            }.resume()
    }
    
    func storeBoss(data: Boss) {
        guard let uploadData = try? JSONEncoder().encode(data) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.bosses, method: Methods.post)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Boss stored!")
            }.resume()
    }
    
    func updateBoss(data: Boss) {
        guard let uploadData = try? JSONEncoder().encode(data) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.bosses, id: data.ID, method: Methods.put)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Boss updated!")
            }.resume()
    }
    
    func deleteBoss(data: Boss) {
        let petition = request(endpoint: Endpoints.bosses, id: data.ID, method: Methods.delete)
        URLSession.shared.dataTask(with: petition){
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Boss deleted!")
            }.resume()
    }
}

