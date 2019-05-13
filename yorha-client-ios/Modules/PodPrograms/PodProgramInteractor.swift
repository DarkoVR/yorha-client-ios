//
//  PodProgramInteractor.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PodProgramInteractor: PodProgramInteractorProtocol {
    weak var presenter: PodProgramPresenterProtocol?
    var remoteData: PodProgramRemoteDataProtocol?
    var localData: PodProgramLocalDataProtocol?
    
    func onError() {
        presenter?.onError()
    }
    
    func retrieveData() {
        do {
            if let data = try localData?.retrievePodPrograms() {
                let PodProgramList = data.map() {
                    return PodProgram(
                        ID: Int($0.id),
                        Name: $0.name!,
                        Program: $0.program!,
                        Cooldown: Int($0.cooldown),
                        Photo: $0.photo!
                    )
                }
                
                if (presenter?.isInternetConnected())! || PodProgramList.isEmpty {
                    remoteData?.retrievePodPrograms()
                }else{
                    print("Local data for PodPrograms retrieved")
                    presenter?.didRetrieveData(data: PodProgramList)
                }
            } else {
                remoteData?.retrievePodPrograms()
            }
            
        } catch {
            presenter?.didRetrieveData(data: [])
        }
    }
    
    func onDataRetrieved(data: [PodProgram]) {
        presenter?.didRetrieveData(data: data)
        
        for PodProgram in data {
            do {
                try localData?.storePodProgram(
                    id: Int32(PodProgram.ID),
                    name: PodProgram.Name,
                    program: PodProgram.Program,
                    cooldown: Int32(PodProgram.Cooldown),
                    photo: PodProgram.Photo
                )
            } catch {
                
            }
        }
    }
}

