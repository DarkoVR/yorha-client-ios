//
//  AutomataProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol AutomataRouterProtocol: class {
    static func createModule() -> UIViewController
    func showDetailScreen(view: AutomataViewProtocol, data: Automata)
}
//MARK: Presenter -
protocol AutomataPresenterProtocol: class {
    var view: AutomataViewProtocol? { get set }
    var interactor: AutomataInteractorProtocol? { get set }
    var router: AutomataRouterProtocol? { get set }
    func viewDidLoad()
    func viewDidRefresh()
    func showDetailScreen(data: Automata)
    func didRetrieveData(data: [Automata])
    func onError()
    func isInternetConnected() -> Bool
}

//MARK: Interactor -
protocol AutomataInteractorProtocol: class {
    var presenter: AutomataPresenterProtocol?  { get set }
    var remoteData: AutomataRemoteDataProtocol?  { get set }
    var localData: AutomataLocalDataProtocol?  { get set }
    func retrieveData()
    func onDataRetrieved(data: [Automata])
    func onError()
}

//MARK: View -
protocol AutomataViewProtocol: class {
    var presenter: AutomataPresenterProtocol?  { get set }
    func showData(with data: [Automata])
    func showError()
    func showLoading()
    func hideLoading()
    func isInternetConnected() -> Bool
}

//Data Manager protocols
protocol AutomataRemoteDataProtocol: class {
    var interactor: AutomataInteractorProtocol?  { get set }
    var presenter: AutomataPresenterProtocol?  { get set }
    func retrieveAutomatas()
    func retrieveOneAutomata(data: Automata)
    func storeAutomata(data: Automata)
    func updateAutomata(data: Automata)
    func deleteAutomata(data: Automata)
}

protocol AutomataLocalDataProtocol: class {
    func retrieveAutomatas() throws -> [AutomataCD]
    func storeAutomata(id: Int32, name: String, occupation: String, photo: String, raceID: Int32, raceName: String) throws
}
