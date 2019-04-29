//
//  AutomataSession.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/28/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

class AutomataSession {
    
    func retrieveAutomatas() {
        let task = URLSession.shared.dataTask(
            with: request(endpoint: Endpoints.automatas)
        ) {
            data, response, error in
            
            guard let data = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            if let jsonPetitions = try? JSONDecoder().decode([Automata].self, from: data) {
                print(jsonPetitions)
            } else {
                print("somenthing went wrong!")
            }
        }
        task.resume()
    }
    
    func retrieveOneAutomata(automata: Automata) {
        let task = URLSession.shared.dataTask(
            with: request(endpoint: Endpoints.automatas, id: automata.ID)
        ) {
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
        }
        task.resume()
    }
    
    func storeAutomata(automata: Automata){
        guard let uploadData = try? JSONEncoder().encode(automata) else {
            return
        }
        
        let task = URLSession.shared.uploadTask(
            with: request(endpoint: Endpoints.automatas, method: Methods.post), from: uploadData
        ) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Automata stored!")
        }
        task.resume()
    }
    
    func updateAutomata(automata: Automata) {
        guard let uploadData = try? JSONEncoder().encode(automata) else {
            return
        }
        
        let task = URLSession.shared.uploadTask(
            with: request(endpoint: Endpoints.automatas, id: automata.ID, method: Methods.put), from: uploadData
        ) {
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Automata updated!")
        }
        task.resume()
    }
    
    func deleteAutomata(automata: Automata) {
        let task = URLSession.shared.dataTask(
            with: request(endpoint: Endpoints.automatas, id: automata.ID, method: Methods.delete)
        ){
            data, response, error in
            
            guard let _ = data, error == nil else {
                print("error = \(error?.localizedDescription as Any)")
                return
            }
            
            print("Automata deleted!")
        }
        task.resume()
    }
}
