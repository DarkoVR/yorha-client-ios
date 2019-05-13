//
//  PodProgramSession.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

class PodProgramSession: PodProgramRemoteDataProtocol {
    var interactor: PodProgramInteractorProtocol?
    var presenter: PodProgramPresenterProtocol?
    
    func retrievePodPrograms() {
        let petition = request(endpoint: Endpoints.podPrograms)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                self.interactor?.onError()
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode([PodProgram].self, from: data) {
                print("petition made to: \(petition) \nwith method: \(petition.httpMethod ?? "") \nwith data: \(jsonPetitions)")
                DispatchQueue.main.async {
                    self.interactor?.onDataRetrieved(data: jsonPetitions)
                }
            } else {
                self.interactor?.onError()
            }
            }.resume()
    }
    
    func retrieveOnePodProgram(data: PodProgram) {
        let petition = request(endpoint: Endpoints.podPrograms, id: data.ID)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode(PodProgram.self, from: data) {
                print(jsonPetitions)
            } else {
                print("somenthing went wrong!")
            }
            }.resume()
    }
    
    func storePodProgram(data: PodProgram) {
        guard let uploadData = try? JSONEncoder().encode(data) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.podPrograms, method: Methods.post)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("PodProgram stored!")
            }.resume()
    }
    
    func updatePodProgram(data: PodProgram) {
        guard let uploadData = try? JSONEncoder().encode(data) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.podPrograms, id: data.ID, method: Methods.put)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("PodProgram updated!")
            }.resume()
    }
    
    func deletePodProgram(data: PodProgram) {
        let petition = request(endpoint: Endpoints.podPrograms, id: data.ID, method: Methods.delete)
        URLSession.shared.dataTask(with: petition){
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("PodProgram deleted!")
            }.resume()
    }
}
