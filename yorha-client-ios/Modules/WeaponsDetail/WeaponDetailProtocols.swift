//
//  WeaponDetailProtocols.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

//MARK: Wireframe -
protocol WeaponDetailRouterProtocol: class {
    static func createModule(data: Weapon) -> UIViewController
}
//MARK: Presenter -
protocol WeaponDetailPresenterProtocol: class {
    var view: WeaponDetailViewProtocol? { get set }
    var router: WeaponDetailRouterProtocol? { get set }
    var data: Weapon? { get set }
    func viewDidLoad()
}

//MARK: View -
protocol WeaponDetailViewProtocol: class {
    var presenter: WeaponDetailPresenterProtocol?  { get set }
    func showDetail(data: Weapon)
}
