//
//  AutomataInteractor.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataInteractor: AutomataInteractorProtocol {
    weak var presenter: AutomataPresenterProtocol?
    var remoteData: AutomataRemoteDataProtocol?
    var localData: AutomataLocalDataProtocol?
    
    func onError() {
        presenter?.onError()
    }
    
    func retrieveData() {
        do {
            if let data = try localData?.retrieveAutomatas() {
                let automataList = data.map() {
                    return Automata(
                        ID: Int($0.id),
                        Name: $0.name!,
                        Occupation: $0.occupation!,
                        Photo: $0.photo!,
                        RaceID: Int($0.raceID),
                        Race: Race(
                            ID: Int($0.raceID),
                            Name: $0.race?.name
                        )
                    )
                }
                
                if (presenter?.isInternetConnected())! || automataList.isEmpty {
                    remoteData?.retrieveAutomatas()
                }else{
                    print("Local data for Automatas retrieved")
                    presenter?.didRetrieveData(data: automataList)
                }
            } else {
                remoteData?.retrieveAutomatas()
            }
            
        } catch {
            presenter?.didRetrieveData(data: [])
        }
    }
    
    func onPostsRetrieved(_ data: [Automata]) {
        presenter?.didRetrieveData(data: data)
        
        for automata in data {
            do {
                try localData?.storeAutomata(
                    id: Int32(automata.ID),
                    name: automata.Name,
                    occupation: automata.Occupation,
                    photo: automata.Photo,
                    raceID: Int32(automata.RaceID),
                    raceName: automata.Race.Name!
                )
            } catch {
                
            }
        }
    }
}
