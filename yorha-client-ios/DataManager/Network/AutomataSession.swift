//
//  AutomataSession.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/28/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

class AutomataSession: AutomataRemoteDataProtocol {
    var interactor: AutomataInteractorProtocol?
    var presenter: AutomataPresenterProtocol?
    
    func retrieveAutomatas() {
        let petition = request(endpoint: Endpoints.automatas)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                self.interactor?.onError()
                return
            }
        
            if let jsonPetitions = try? JSONDecoder().decode([Automata].self, from: data) {
                print("petition made to: \(petition) \nwith method: \(petition.httpMethod ?? "") \nwith data: \(jsonPetitions)")
                DispatchQueue.main.async {
                    self.interactor?.onPostsRetrieved(jsonPetitions)
                }
            } else {
                self.interactor?.onError()
            }
        }.resume()
    }
    
    func retrieveOneAutomata(automata: Automata) {
        let petition = request(endpoint: Endpoints.automatas, id: automata.ID)
        URLSession.shared.dataTask(with: petition) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode(Automata.self, from: data) {
                print(jsonPetitions)
            } else {
                print("somenthing went wrong!")
            }
        }.resume()
    }
    
    func storeAutomata(automata: Automata) {
        guard let uploadData = try? JSONEncoder().encode(automata) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.automatas, method: Methods.post)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Automata stored!")
        }.resume()
    }
    
    func updateAutomata(automata: Automata) {
        guard let uploadData = try? JSONEncoder().encode(automata) else {
            return
        }
        
        let petition = request(endpoint: Endpoints.automatas, id: automata.ID, method: Methods.put)
        URLSession.shared.uploadTask(with: petition, from: uploadData) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Automata updated!")
        }.resume()
    }
    
    func deleteAutomata(automata: Automata) {
        let petition = request(endpoint: Endpoints.automatas, id: automata.ID, method: Methods.delete)
        URLSession.shared.dataTask(with: petition){
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Automata deleted!")
        }.resume()
    }
}
