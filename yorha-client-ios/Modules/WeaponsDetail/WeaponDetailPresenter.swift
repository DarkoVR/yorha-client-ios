//
//  WeaponDetailPresenter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 5/11/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class WeaponDetailPresenter: WeaponDetailPresenterProtocol {
    
    weak internal var view: WeaponDetailViewProtocol?
    var router: WeaponDetailRouterProtocol?
    var data: Weapon?
    
    init(interface: WeaponDetailViewProtocol, router: WeaponDetailRouterProtocol) {
        self.view = interface
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showDetail(data: data!)
    }
}
