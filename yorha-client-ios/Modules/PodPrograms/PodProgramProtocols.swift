//
//  PodProgramProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol PodProgramRouterProtocol: class {
    static func createModule() -> UIViewController
    func showDetailScreen(view: PodProgramViewProtocol, data: PodProgram)
}
//MARK: Presenter -
protocol PodProgramPresenterProtocol: class {
    var view: PodProgramViewProtocol? { get set }
    var interactor: PodProgramInteractorProtocol? { get set }
    var router: PodProgramRouterProtocol? { get set }
    func viewDidLoad()
    func viewDidRefresh()
    func showDetailScreen(data: PodProgram)
    func didRetrieveData(data: [PodProgram])
    func onError()
    func isInternetConnected() -> Bool
}

//MARK: Interactor -
protocol PodProgramInteractorProtocol: class {
    var presenter: PodProgramPresenterProtocol?  { get set }
    var remoteData: PodProgramRemoteDataProtocol?  { get set }
    var localData: PodProgramLocalDataProtocol?  { get set }
    func retrieveData()
    func onDataRetrieved(data: [PodProgram])
    func onError()
}

//MARK: View -
protocol PodProgramViewProtocol: class {
    var presenter: PodProgramPresenterProtocol?  { get set }
    func showData(with data: [PodProgram])
    func showError()
    func showLoading()
    func hideLoading()
    func isInternetConnected() -> Bool
}

//Data Manager protocols
protocol PodProgramRemoteDataProtocol: class {
    var interactor: PodProgramInteractorProtocol?  { get set }
    var presenter: PodProgramPresenterProtocol?  { get set }
    func retrievePodPrograms()
    func retrieveOnePodProgram(data: PodProgram)
    func storePodProgram(data: PodProgram)
    func updatePodProgram(data: PodProgram)
    func deletePodProgram(data: PodProgram)
}

protocol PodProgramLocalDataProtocol: class {
    func retrievePodPrograms() throws -> [PodProgramCD]
    func storePodProgram(id: Int32, name: String, program: String, cooldown: Int32, photo: String) throws
}
