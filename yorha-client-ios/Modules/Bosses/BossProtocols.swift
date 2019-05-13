//
//  BossProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol BossRouterProtocol: class {
    static func createModule() -> UIViewController
    func showDetailScreen(view: BossViewProtocol, data: Boss)
}
//MARK: Presenter -
protocol BossPresenterProtocol: class {
    var view: BossViewProtocol? { get set }
    var interactor: BossInteractorProtocol? { get set }
    var router: BossRouterProtocol? { get set }
    func viewDidLoad()
    func viewDidRefresh()
    func showDetailScreen(data: Boss)
    func didRetrieveData(data: [Boss])
    func onError()
    func isInternetConnected() -> Bool
}

//MARK: Interactor -
protocol BossInteractorProtocol: class {
    var presenter: BossPresenterProtocol?  { get set }
    var remoteData: BossRemoteDataProtocol?  { get set }
    var localData: BossLocalDataProtocol?  { get set }
    func retrieveData()
    func onDataRetrieved(data: [Boss])
    func onError()
}

//MARK: View -
protocol BossViewProtocol: class {
    var presenter: BossPresenterProtocol?  { get set }
    func showData(with data: [Boss])
    func showError()
    func showLoading()
    func hideLoading()
    func isInternetConnected() -> Bool
}

//Data Manager protocols
protocol BossRemoteDataProtocol: class {
    var interactor: BossInteractorProtocol?  { get set }
    var presenter: BossPresenterProtocol?  { get set }
    func retrieveBosses()
    func retrieveOneBoss(data: Boss)
    func storeBoss(data: Boss)
    func updateBoss(data: Boss)
    func deleteBoss(data: Boss)
}

protocol BossLocalDataProtocol: class {
    func retrieveBosses() throws -> [BossCD]
    func storeBoss(id: Int32, name: String, faction: String, photo: String, zones: [Zone]) throws
}
