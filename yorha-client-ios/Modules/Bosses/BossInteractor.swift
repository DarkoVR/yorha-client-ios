//
//  BossInteractor.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class BossInteractor: BossInteractorProtocol {
    weak var presenter: BossPresenterProtocol?
    var remoteData: BossRemoteDataProtocol?
    var localData: BossLocalDataProtocol?
    
    func onError() {
        presenter?.onError()
    }
    
    func retrieveData() {
        do {
            if let data = try localData?.retrieveBosses() {
                let BossList: [Boss] = data.map() {
                    let newZones: [Zone] = []
                    return Boss(
                        ID: Int($0.id),
                        Name: $0.name!,
                        Faction: $0.faction!,
                        Zones: newZones,
                        Photo: $0.photo!
                    )
                }
                
                if (presenter?.isInternetConnected())! || BossList.isEmpty {
                    remoteData?.retrieveBosses()
                } else {
                    print("Local data for Bosss retrieved")
                    presenter?.didRetrieveData(data: BossList)
                }
            } else {
                remoteData?.retrieveBosses()
            }
            
        } catch {
            presenter?.didRetrieveData(data: [])
        }
    }
    
    func onPostsRetrieved(_ data: [Boss]) {
        presenter?.didRetrieveData(data: data)
        
        /*for Boss in data {
            do {
                try localData?.storeBoss(
                    id: Int32(Boss.ID),
                    name: Boss.Name,
                    faction: Boss.Faction,
                    photo: Boss.Photo,
                    zones: Boss.Zones
                )
            } catch {
                
            }
        }*/
    }
}
