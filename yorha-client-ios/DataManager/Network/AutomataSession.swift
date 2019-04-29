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
        let task = URLSession.shared.dataTask(with: request(endpoint: Endpoints.automatas)) {
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
}
