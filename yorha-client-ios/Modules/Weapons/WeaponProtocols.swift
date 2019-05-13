//
//  WeaponProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol WeaponRouterProtocol: class {
    static func createModule() -> UIViewController
    func showDetailScreen(view: WeaponViewProtocol, data: Weapon)
}
//MARK: Presenter -
protocol WeaponPresenterProtocol: class {
    var view: WeaponViewProtocol? { get set }
    var interactor: WeaponInteractorProtocol? { get set }
    var router: WeaponRouterProtocol? { get set }
    func viewDidLoad()
    func viewDidRefresh()
    func showDetailScreen(data: Weapon)
    func didRetrieveData(data: [Weapon])
    func onError()
    func isInternetConnected() -> Bool
}

//MARK: Interactor -
protocol WeaponInteractorProtocol: class {
    var presenter: WeaponPresenterProtocol?  { get set }
    var remoteData: WeaponRemoteDataProtocol?  { get set }
    var localData: WeaponLocalDataProtocol?  { get set }
    func retrieveData()
    func onDataRetrieved(data: [Weapon])
    func onError()
}

//MARK: View -
protocol WeaponViewProtocol: class {
    var presenter: WeaponPresenterProtocol?  { get set }
    func showData(with data: [Weapon])
    func showError()
    func showLoading()
    func hideLoading()
    func isInternetConnected() -> Bool
}

//Data Manager protocols
protocol WeaponRemoteDataProtocol: class {
    var interactor: WeaponInteractorProtocol?  { get set }
    var presenter: WeaponPresenterProtocol?  { get set }
    func retrieveWeapons()
    func retrieveOneWeapon(data: Weapon)
    func storeWeapon(data: Weapon)
    func updateWeapon(data: Weapon)
    func deleteWeapon(data: Weapon)
}

protocol WeaponLocalDataProtocol: class {
    func retrieveWeapons() throws -> [WeaponCD]
    func storeWeapon(id: Int32, name: String, minAttack: Int32, maxAttack: Int32, ability: String, photo: String, classID: Int32, className: String) throws
}
